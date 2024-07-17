function isScrollable(element) {
    return element.scrollWidth > element.clientWidth;
}

function updateScrollButtonStates(scrollable, leftButton, rightButton) {
    const isAtStart = scrollable.scrollLeft === 0;
    const isAtEnd = scrollable.scrollLeft + scrollable.clientWidth >= scrollable.scrollWidth - 1; // -1 to account for rounding errors

    leftButton.disabled = isAtStart;
    rightButton.disabled = isAtEnd;

    leftButton.classList.toggle('disabled', isAtStart);
    rightButton.classList.toggle('disabled', isAtEnd);
}

function updateScrollButtonVisibility(scrollable, buttonGroup) {
    if (isScrollable(scrollable)) {
        buttonGroup.style.display = 'flex';
        const leftButton = buttonGroup.querySelector(".left-scroll-button");
        const rightButton = buttonGroup.querySelector(".right-scroll-button");
        updateScrollButtonStates(scrollable, leftButton, rightButton);
    } else {
        buttonGroup.style.display = 'none';
    }
}

function scroll(direction) {
    return function (event) {
        const buttonGroup = event.target.closest(".scroll-button-group");
        const scrollableID = buttonGroup.getAttribute("data-scrollable");
        const scrollable = document.getElementById(scrollableID);
        const cardWidth = scrollable.querySelector(".card").offsetWidth + 32;

        if (scrollable) {
            scrollable.scrollBy({
                top: 0,
                left: direction * cardWidth,
                behavior: 'smooth'
            });

            setTimeout(() => {
                const leftButton = buttonGroup.querySelector(".left-scroll-button");
                const rightButton = buttonGroup.querySelector(".right-scroll-button");
                updateScrollButtonStates(scrollable, leftButton, rightButton);
            }, 500);
        }
    };
}

const scrollToRight = scroll(1);
const scrollToLeft = scroll(-1);

function initializeScrollButtons() {
    document.querySelectorAll(".scroll-button-group").forEach(buttonGroup => {
        const scrollableID = buttonGroup.getAttribute("data-scrollable");
        const scrollable = document.getElementById(scrollableID);

        if (scrollable) {
            const leftButton = buttonGroup.querySelector(".left-scroll-button");
            const rightButton = buttonGroup.querySelector(".right-scroll-button");

            updateScrollButtonVisibility(scrollable, buttonGroup);

            leftButton.addEventListener("click", scrollToLeft);
            rightButton.addEventListener("click", scrollToRight);

            scrollable.addEventListener('scroll', () => {
                updateScrollButtonStates(scrollable, leftButton, rightButton);
            });

            window.addEventListener('resize', () => {
                updateScrollButtonVisibility(scrollable, buttonGroup);
            });

            const observer = new MutationObserver(() => {
                updateScrollButtonVisibility(scrollable, buttonGroup);
            });
            observer.observe(scrollable, { childList: true, subtree: true });
        }
    });
}

document.addEventListener('DOMContentLoaded', initializeScrollButtons);
