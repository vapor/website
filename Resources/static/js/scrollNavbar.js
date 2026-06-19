window.onscroll = function () {
    // The hide-until-scrolled behaviour is only for the home page hero; every
    // other page keeps the navbar visible from the top (CSS default).
    if (!document.body.classList.contains("home-page")) {
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
