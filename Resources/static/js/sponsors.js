// Populates the Backers grid on the Team page, mirroring vapor's README
// "Backers" section: GitHub Sponsors (parsed from the README's generated
// `<!-- backers -->` block) followed by OpenCollective backers. The curated
// "Sponsors" logos are rendered statically by the server.
//
// Everything is fetched client-side and tokenless - the README is read from
// raw.githubusercontent.com (the GitHub Sponsors list there is generated with a
// PAT in vapor/vapor's own workflow, so we don't need one). Results are cached
// in localStorage. Falls back gracefully if both sources fail.
"use strict";

document.addEventListener("DOMContentLoaded", async function () {
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

  // README order: GitHub Sponsors first, then OpenCollective. Each source fails
  // independently (returns []), so one being down doesn't block the other.
  const [github, openCollective] = await Promise.all([
    fetchGitHubBackers(),
    fetchOpenCollectiveBackers(),
  ]);
  const backers = github.concat(openCollective);
  if (backers.length === 0) {
    showFallback();
    return;
  }
  writeCache(backers);
  render(backers);

  // GitHub Sponsors - parse the generated block from the README.
  async function fetchGitHubBackers() {
    try {
      const response = await fetch(README_URL);
      if (!response.ok) {
        return [];
      }
      const readme = await response.text();
      const block = readme.match(/<!-- backers -->([\s\S]*?)<!-- backers -->/);
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
    } catch (error) {
      return [];
    }
  }

  // OpenCollective backers — paying members, deduped by profile.
  async function fetchOpenCollectiveBackers() {
    try {
      const response = await fetch(OPENCOLLECTIVE_URL);
      if (!response.ok) {
        return [];
      }
      const data = await response.json();
      const byProfile = new Map();
      data.forEach((member) => {
        if (member.role !== "BACKER" || (member.totalAmountDonated || 0) <= 0) {
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
    } catch (error) {
      return [];
    }
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
    return String(value).replace(
      /&(#[xX][0-9a-fA-F]+|#\d+|amp|lt|gt|quot);/g,
      (_, entity) => {
        if (entity.charAt(0) === "#") {
          const isHex = entity.charAt(1) === "x" || entity.charAt(1) === "X";
          const codePoint = isHex
            ? parseInt(entity.slice(2), 16)
            : parseInt(entity.slice(1), 10);
          return String.fromCodePoint(codePoint);
        }
        return { amp: "&", lt: "<", gt: ">", quot: '"' }[entity];
      },
    );
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
