// Client-side search, sort and pagination for the Showcase page
(function () {
  "use strict";

  const PAGE_SIZE = 9;

  const grid = document.getElementById("showcase-grid");
  const searchInput = document.getElementById("showcase-search");
  const sortSelect = document.getElementById("showcase-sort");
  const pagination = document.getElementById("showcase-pagination");
  const emptyState = document.getElementById("showcase-empty");

  if (!grid) {
    return;
  }

  const items = Array.from(grid.querySelectorAll(".showcase-grid-item"));
  let currentPage = 1;

  function matchesQuery(item, query) {
    if (!query) {
      return true;
    }
    const name = (item.dataset.name || "").toLowerCase();
    const description = (item.dataset.description || "").toLowerCase();
    return name.includes(query) || description.includes(query);
  }

  function sortItems(list) {
    const sort = sortSelect ? sortSelect.value : "newest";
    const byIndex = (a, b) => Number(a.dataset.index) - Number(b.dataset.index);
    const byName = (a, b) =>
      (a.dataset.name || "").localeCompare(b.dataset.name || "");

    switch (sort) {
      case "oldest":
        return list.sort((a, b) => byIndex(b, a));
      case "name-asc":
        return list.sort(byName);
      case "name-desc":
        return list.sort((a, b) => byName(b, a));
      case "newest":
      default:
        return list.sort(byIndex);
    }
  }

  function buildPageButton(
    label,
    page,
    { disabled = false, active = false, ariaLabel } = {},
  ) {
    const li = document.createElement("li");
    li.className =
      "page-item" + (disabled ? " disabled" : "") + (active ? " active" : "");

    let node;
    if (active || disabled) {
      node = document.createElement("span");
    } else {
      node = document.createElement("a");
      node.href = "#showcase-grid";
      node.addEventListener("click", function (event) {
        event.preventDefault();
        currentPage = page;
        render();
        grid.scrollIntoView({ behavior: "smooth", block: "start" });
      });
    }
    node.className = "page-link";
    node.innerHTML = label;
    if (ariaLabel) {
      node.setAttribute("aria-label", ariaLabel);
    }
    if (active) {
      li.setAttribute("aria-current", "page");
    }
    li.appendChild(node);
    return li;
  }

  function renderPagination(totalPages) {
    if (!pagination) {
      return;
    }
    pagination.innerHTML = "";

    if (totalPages <= 1) {
      pagination.classList.add("d-none");
      return;
    }
    pagination.classList.remove("d-none");

    const prevIcon =
      '<span class="vapor-icon icon-chevron-left" aria-hidden="true"></span>';
    pagination.appendChild(
      buildPageButton(prevIcon, currentPage - 1, {
        disabled: currentPage === 1,
        ariaLabel: "Previous",
      }),
    );

    for (let page = 1; page <= totalPages; page++) {
      pagination.appendChild(
        buildPageButton(String(page), page, { active: page === currentPage }),
      );
    }

    const nextIcon =
      '<span class="vapor-icon icon-chevron-right" aria-hidden="true"></span>';
    pagination.appendChild(
      buildPageButton(nextIcon, currentPage + 1, {
        disabled: currentPage === totalPages,
        ariaLabel: "Next",
      }),
    );
  }

  function render() {
    const query = searchInput ? searchInput.value.trim().toLowerCase() : "";

    // Hide everything, then reveal only the current page of matches in order.
    items.forEach((item) => {
      item.classList.add("d-none");
    });

    const matches = sortItems(
      items.filter((item) => matchesQuery(item, query)),
    );
    const totalPages = Math.max(1, Math.ceil(matches.length / PAGE_SIZE));
    currentPage = Math.min(currentPage, totalPages);

    const start = (currentPage - 1) * PAGE_SIZE;
    const pageItems = matches.slice(start, start + PAGE_SIZE);

    pageItems.forEach((item, position) => {
      item.classList.remove("d-none");
      item.style.order = String(position);
    });

    if (emptyState) {
      emptyState.classList.toggle("d-none", matches.length !== 0);
    }

    renderPagination(totalPages);
  }

  if (searchInput) {
    searchInput.addEventListener("input", function () {
      currentPage = 1;
      render();
    });
  }
  if (sortSelect) {
    sortSelect.addEventListener("change", function () {
      currentPage = 1;
      render();
    });
  }

  render();
})();
