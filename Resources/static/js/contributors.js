// Populates the "Contributors" grid on the Team page from the GitHub API,
// caching the result in localStorage to avoid refetching (and hitting the
// unauthenticated rate limit) on every visit. Falls back gracefully if the
// request fails and there's no cache. Pagination is handled by vaporPaginate
// (see pagination.js).
"use strict";

document.addEventListener("DOMContentLoaded", async function () {
  const grid = document.getElementById("contributors-grid");
  if (!grid) {
    return;
  }

  const REPO = "vapor/vapor";
  const TARGET_PER_PAGE = 15;
  const MAX_PAGES = 5;
  const CACHE_KEY = "vapor:contributors:" + REPO;
  const CACHE_TTL = 6 * 60 * 60 * 1000; // 6 hours
  // Bot accounts that aren't flagged as type "Bot" by the API.
  const BLOCKED_LOGINS = ["vaporbot"];

  const cached = readCache();
  if (cached) {
    renderPeople(cached);
    return;
  }

  try {
    const data = await fetchAllContributors();
    const people = data
      .filter(
        (c) =>
          c.type === "User" &&
          BLOCKED_LOGINS.indexOf(c.login.toLowerCase()) === -1,
      )
      .map((c) => ({
        login: c.login,
        avatar_url: c.avatar_url,
        html_url: c.html_url,
      }));
    writeCache(people);
    renderPeople(people);
  } catch (error) {
    console.error("Error fetching contributors:", error);
    showFallback();
  }

  // Walk the paginated contributors endpoint (100 per page) until a short page
  async function fetchAllContributors() {
    const all = [];
    for (let page = 1; page <= MAX_PAGES; page++) {
      const response = await fetch(
        `https://api.github.com/repos/${REPO}/contributors?per_page=100&page=${page}`,
      );
      if (!response.ok) {
        if (page === 1) {
          throw response.status;
        }
        break;
      }
      const batch = await response.json();
      all.push(...batch);
      if (batch.length < 100) {
        break;
      }
    }
    return all;
  }

  function renderPeople(people) {
    if (!people || people.length === 0) {
      showFallback();
      return;
    }
    const shuffled = shuffle(people.slice());
    grid.innerHTML = shuffled.map(buildCard).join("");
    if (typeof window.vaporPaginate !== "function") {
      return;
    }

    const items = Array.from(grid.querySelectorAll(".contributor-card"));
    const paginationEl = document.getElementById("contributors-pagination");
    let lastColumns = 0;

    // Re-paginate with a page size that's a whole number of rows for the
    // current column count, so the last row of each page is always full.
    function paginate() {
      const columns = columnCount();
      if (columns === lastColumns) {
        return;
      }
      lastColumns = columns;
      window.vaporPaginate({
        items: items,
        paginationEl: paginationEl,
        pageSize: columns * Math.max(1, Math.round(TARGET_PER_PAGE / columns)),
      });
    }

    paginate();

    // The column count changes at the responsive breakpoints, so recompute on resize
    let resizeTimer;
    window.addEventListener("resize", function () {
      clearTimeout(resizeTimer);
      resizeTimer = setTimeout(paginate, 150);
    });
  }

  function columnCount() {
    const tracks = getComputedStyle(grid)
      .gridTemplateColumns.split(" ")
      .filter(Boolean);
    return Math.max(1, tracks.length);
  }

  function buildCard(contributor) {
    const url = contributor.html_url;
    const login = contributor.login;

    return `
            <div class="contributor-card">
                <a href="${url}" target="_blank" rel="noopener" aria-label="${login} on GitHub">
                    <img src="${contributor.avatar_url}" alt="${login}" class="contributor-avatar" loading="lazy">
                </a>
                <p class="contributor-name">${login}</p>
            </div>`;
  }

  function shuffle(array) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
  }

  function showFallback() {
    const fallback = document.getElementById("contributors-empty");
    if (fallback) {
      fallback.classList.remove("d-none");
    }
  }

  function readCache() {
    try {
      const raw = localStorage.getItem(CACHE_KEY);
      if (!raw) {
        return null;
      }
      const parsed = JSON.parse(raw);
      if (!parsed.timestamp || Date.now() - parsed.timestamp > CACHE_TTL) {
        return null;
      }
      return parsed.data;
    } catch (error) {
      return null;
    }
  }

  function writeCache(data) {
    try {
      localStorage.setItem(
        CACHE_KEY,
        JSON.stringify({ timestamp: Date.now(), data: data }),
      );
    } catch (error) {}
  }
});
