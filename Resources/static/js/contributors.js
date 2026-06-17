// Populates the "Contributors" grid on the Team page from the GitHub API,
// caching the result in localStorage to avoid refetching (and hitting the
// unauthenticated rate limit) on every visit. Falls back gracefully if the
// request fails and there's no cache. Pagination is handled by vaporPaginate
// (see pagination.js).
document.addEventListener("DOMContentLoaded", function () {
  const grid = document.getElementById("contributors-grid");
  if (!grid) {
    return;
  }

  const REPO = "vapor/vapor";
  const MAX = 48;
  const PAGE_SIZE = 15;
  const CACHE_KEY = "vapor:contributors:" + REPO;
  const CACHE_TTL = 6 * 60 * 60 * 1000; // 6 hours
  // Bot accounts that aren't flagged as type "Bot" by the API.
  const BLOCKED_LOGINS = ["vaporbot"];

  const cached = readCache();
  if (cached) {
    renderPeople(cached);
    return;
  }

  fetch(`https://api.github.com/repos/${REPO}/contributors?per_page=100`)
    .then((response) =>
      response.ok ? response.json() : Promise.reject(response.status),
    )
    .then((data) => {
      const people = data
        .filter(
          (c) =>
            c.type === "User" &&
            BLOCKED_LOGINS.indexOf(c.login.toLowerCase()) === -1,
        )
        .slice(0, MAX)
        .map((c) => ({
          login: c.login,
          avatar_url: c.avatar_url,
          html_url: c.html_url,
          contributions: c.contributions,
        }));
      writeCache(people);
      renderPeople(people);
    })
    .catch((error) => {
      console.error("Error fetching contributors:", error);
      showFallback();
    });

  function renderPeople(people) {
    if (!people || people.length === 0) {
      showFallback();
      return;
    }
    const shuffled = shuffle(people.slice());
    grid.innerHTML = shuffled.map(buildCard).join("");
    if (typeof window.vaporPaginate === "function") {
      window.vaporPaginate({
        items: Array.from(grid.querySelectorAll(".contributor-card")),
        paginationEl: document.getElementById("contributors-pagination"),
        pageSize: PAGE_SIZE,
      });
    }
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
