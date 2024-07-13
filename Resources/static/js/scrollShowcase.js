function scrollToRight() {
    var element = document.getElementById("showcase-scrolling-wrapper");
    element.scrollBy({
        top: 0,
        left: 320,
        behavior: 'smooth'
    });
}

function scrollToLeft() {
    var element = document.getElementById("showcase-scrolling-wrapper");
    element.scrollBy({
        top: 0,
        left: -320,
        behavior: 'smooth'
    });
}
