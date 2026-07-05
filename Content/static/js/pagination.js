// Shared client-side pagination for the Team page. Given a list of DOM elements
// it shows one page at a time and renders the design system's pagination markup
// (boxed Previous/Next buttons, active page, mobile "Page X of Y") into the
// provided control, reusing the same `.pagination` styling used across the site.
(function () {
  "use strict";

  function element(tag, className, html) {
    const node = document.createElement(tag);
    if (className) {
      node.className = className;
    }
    if (html != null) {
      node.innerHTML = html;
    }
    return node;
  }

  window.vaporPaginate = function (options) {
    const items = options.items || [];
    const paginationEl = options.paginationEl;
    const pageSize = options.pageSize;

    const totalPages = Math.max(1, Math.ceil(items.length / pageSize));
    let currentPage = 1;

    function goToPage(page) {
      currentPage = page;
      render();
    }

    function navItem(kind, page, disabled) {
      const isPrevious = kind === "previous";
      const li = element(
        "li",
        "page-item " +
          (isPrevious ? "me-auto" : "ms-auto") +
          (disabled ? " disabled" : ""),
      );
      const link = element(
        "a",
        "page-link page-link-next-previous d-flex page-link-" + kind,
      );
      link.href = "#";
      link.setAttribute("aria-label", isPrevious ? "Previous" : "Next");

      const icon =
        '<span class="vapor-icon icon-chevron-' +
        (isPrevious ? "left" : "right") +
        '" aria-hidden="true"></span>';
      const label =
        '<div class="d-none d-lg-block">' +
        (isPrevious ? "Previous" : "Next") +
        "</div>";
      link.innerHTML = isPrevious ? icon + label : label + icon;

      if (!disabled) {
        link.addEventListener("click", function (event) {
          event.preventDefault();
          goToPage(page);
        });
      }
      li.appendChild(link);
      return li;
    }

    // The page numbers to show. For many pages, collapse the middle with
    // ellipses: always show the first/last three and the active page's
    // neighbours (mirrors the design system's Pagination component).
    function pageNumbers() {
      if (totalPages <= 9) {
        return Array.from({ length: totalPages }, (_, i) => i + 1);
      }
      const shown = new Set([
        1,
        2,
        3,
        totalPages - 2,
        totalPages - 1,
        totalPages,
        currentPage - 1,
        currentPage,
        currentPage + 1,
      ]);
      const sorted = Array.from(shown)
        .filter((p) => p >= 1 && p <= totalPages)
        .sort((a, b) => a - b);

      const result = [];
      let previous = 0;
      sorted.forEach((page) => {
        if (page - previous > 1) {
          result.push("ellipsis");
        }
        result.push(page);
        previous = page;
      });
      return result;
    }

    function ellipsisItem() {
      return element(
        "li",
        "page-item pagination-ellipsis d-none d-lg-block ms-1 me-1",
        "…",
      );
    }

    // Numbered page (hidden on mobile, where the "Page X of Y" indicator shows).
    function numberItem(page) {
      const active = page === currentPage;
      const li = element(
        "li",
        "page-item d-none d-lg-block" + (active ? " active" : ""),
      );
      if (active) {
        li.setAttribute("aria-current", "page");
        li.appendChild(element("span", "page-link", String(page)));
      } else {
        const link = element("a", "page-link", String(page));
        link.href = "#";
        link.addEventListener("click", function (event) {
          event.preventDefault();
          goToPage(page);
        });
        li.appendChild(link);
      }
      return li;
    }

    function renderPagination() {
      if (!paginationEl) {
        return;
      }
      paginationEl.innerHTML = "";

      if (totalPages <= 1) {
        paginationEl.classList.add("d-none");
        return;
      }
      paginationEl.classList.remove("d-none");

      paginationEl.appendChild(
        navItem("previous", currentPage - 1, currentPage === 1),
      );
      pageNumbers().forEach((page) => {
        paginationEl.appendChild(
          page === "ellipsis" ? ellipsisItem() : numberItem(page),
        );
      });
      paginationEl.appendChild(
        element(
          "li",
          "page-item pagination-ellipsis d-lg-none",
          "Page " + currentPage + " of " + totalPages,
        ),
      );
      paginationEl.appendChild(
        navItem("next", currentPage + 1, currentPage === totalPages),
      );
    }

    function render() {
      const start = (currentPage - 1) * pageSize;
      const end = start + pageSize;
      items.forEach((item, index) => {
        item.classList.toggle("d-none", index < start || index >= end);
      });
      renderPagination();
    }

    render();
  };
})();
