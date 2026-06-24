window.onscroll = function () {
    // The hide-until-scrolled behaviour is only for the home page — the only page
    // with the fixed navbar (its <body> is the one tagged id="main-page-body").
    // Every other page leaves the navbar in normal flow, like the blog.
    if (document.body.id !== "main-page-body") {
        return;
    }

    const navbar = document.querySelector(".navbar");

    if (navbar === null) {
        return;
    }

    if (document.body.scrollTop > 600 || document.documentElement.scrollTop > 600) {
        navbar.style.top = "0";
    } else {
        navbar.style.top = "-80px";
    }
}
