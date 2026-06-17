// Cursor-tracking spotlight for the Team page's call-to-action box. Updates the
// --cta-x / --cta-y CSS variables to the pointer position (relative to the box),
// which the `.team-cta::before` radial gradient follows. Throttled to one update
// per animation frame.

document.addEventListener("DOMContentLoaded", function () {
    const cta = document.querySelector(".team-cta");
    if (!cta) {
        return;
    }

    let frame = null;
    cta.addEventListener("pointermove", function (event) {
        if (frame) {
            return;
        }
        frame = requestAnimationFrame(function () {
            frame = null;
            const rect = cta.getBoundingClientRect();
            cta.style.setProperty("--cta-x", event.clientX - rect.left + "px");
            cta.style.setProperty("--cta-y", event.clientY - rect.top + "px");
        });
    });
});
