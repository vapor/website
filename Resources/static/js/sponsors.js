// Populates the Backers grid on the Team page, mirroring vapor's README
// "Backers" section: GitHub Sponsors (parsed from the README's generated
// `<!-- backers -->` block) followed by OpenCollective backers. The curated
// "Sponsors" logos are rendered statically by the server.
//
// Everything is fetched client-side and tokenless - the README is read from
// raw.githubusercontent.com (the GitHub Sponsors list there is generated with a
// PAT in vapor/vapor's own workflow, so we don't need one). Results are cached
// in localStorage. Falls back gracefully if both sources fail.
document.addEventListener("DOMContentLoaded", function () {
  const grid = document.getElementById("backers-grid");
  if (!grid) {
    return;
  }

  const PAGE_SIZE = 18;
  const README_URL =
    "https://raw.githubusercontent.com/vapor/vapor/main/README.md";
  const OPENCOLLECTIVE_URL =
    "https://opencollective.com/vapor/members/all.json";
  const CACHE_KEY = "vapor:backers:v1";
  const CACHE_TTL = 6 * 60 * 60 * 1000; // 6 hours

  const cached = readCache();
  if (cached) {
    render(cached);
    return;
  }

  Promise.allSettled([fetchGitHubBackers(), fetchOpenCollectiveBackers()]).then(
    (results) => {
      const github = results[0].status === "fulfilled" ? results[0].value : [];
      const openCollective =
        results[1].status === "fulfilled" ? results[1].value : [];
      // README order: GitHub Sponsors first, then OpenCollective.
      const backers = github.concat(openCollective);
      if (backers.length === 0) {
        showFallback();
        return;
      }
      writeCache(backers);
      render(backers);
    },
  );

  // GitHub Sponsors - parse the generated block from the README.
  function fetchGitHubBackers() {
    return fetch(README_URL)
      .then((response) =>
        response.ok ? response.text() : Promise.reject(response.status),
      )
      .then((readme) => {
        const block = readme.match(
          /<!-- backers -->([\s\S]*?)<!-- backers -->/,
        );
        if (!block) {
          return [];
        }
        const people = [];
        const linkRe =
          /<a href="(https:\/\/github\.com\/[^"]+)">\s*<img[^>]*alt="User avatar:\s*([^"]*)"/g;
        let match;
        while ((match = linkRe.exec(block[1])) !== null) {
          const url = match[1];
          const login = url.split("/").pop();
          const name = decodeEntities(match[2]).trim() || login;
          people.push({
            name: name,
            avatar: "https://github.com/" + login + ".png",
            url: url,
          });
        }
        return people;
      });
  }

  // OpenCollective backers — paying members, deduped by profile.
  function fetchOpenCollectiveBackers() {
    return fetch(OPENCOLLECTIVE_URL)
      .then((response) =>
        response.ok ? response.json() : Promise.reject(response.status),
      )
      .then((data) => {
        const byProfile = new Map();
        data.forEach((member) => {
          if (
            member.role !== "BACKER" ||
            (member.totalAmountDonated || 0) <= 0
          ) {
            return;
          }
          const key = member.profile || member.name;
          if (!byProfile.has(key)) {
            byProfile.set(key, {
              name: member.name,
              avatar: member.image || null,
              url: member.profile || null,
            });
          }
        });
        return Array.from(byProfile.values());
      });
  }

  function render(backers) {
    if (!backers || backers.length === 0) {
      showFallback();
      return;
    }

    const countEl = document.getElementById("sponsors-count");
    if (countEl) {
      const base = parseInt(countEl.getAttribute("data-sponsors") || "0", 10);
      countEl.textContent = (base + backers.length).toLocaleString();
    }

    grid.innerHTML = backers.map(buildCard).join("");
    if (typeof window.vaporPaginate === "function") {
      window.vaporPaginate({
        items: Array.from(grid.querySelectorAll(".team-sponsor")),
        paginationEl: document.getElementById("backers-pagination"),
        pageSize: PAGE_SIZE,
      });
    }
  }

  function buildCard(backer) {
    const name = escapeHtml(backer.name);
    const avatar = backer.avatar
      ? `<img src="${encodeURI(backer.avatar)}" alt="${name}" class="sponsor-avatar" loading="lazy">`
      : `<div class="sponsor-avatar sponsor-avatar-fallback" aria-hidden="true">${initial(backer.name)}</div>`;
    const inner = `${avatar}<p class="sponsor-name">${name}</p>`;
    return backer.url
      ? `<a class="team-sponsor" href="${encodeURI(backer.url)}" target="_blank" rel="noopener">${inner}</a>`
      : `<div class="team-sponsor">${inner}</div>`;
  }

  function initial(name) {
    const trimmed = (name || "").trim();
    return trimmed ? escapeHtml(trimmed.charAt(0).toUpperCase()) : "?";
  }

  function decodeEntities(value) {
    return String(value)
      .replace(/&#x([0-9a-fA-F]+);/g, (_, hex) =>
        String.fromCodePoint(parseInt(hex, 16)),
      )
      .replace(/&#(\d+);/g, (_, dec) => String.fromCodePoint(parseInt(dec, 10)))
      .replace(/&amp;/g, "&")
      .replace(/&lt;/g, "<")
      .replace(/&gt;/g, ">")
      .replace(/&quot;/g, '"')
      .replace(/&#39;/g, "'");
  }

  function escapeHtml(value) {
    return String(value).replace(/[&<>"']/g, (char) => {
      return {
        "&": "&amp;",
        "<": "&lt;",
        ">": "&gt;",
        '"': "&quot;",
        "'": "&#39;",
      }[char];
    });
  }

  function showFallback() {
    const fallback = document.getElementById("backers-empty");
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
    } catch (error) {
      // Ignore storage errors (private mode / quota) — caching is best-effort.
    }
  }
});
