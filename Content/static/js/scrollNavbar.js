window.onscroll = function () {
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
