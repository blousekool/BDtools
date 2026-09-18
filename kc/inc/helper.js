(() => {
    const logo = document.querySelector('img[src$="images/klimbos-garderen-logo-banner2.png"]');
    if (!logo) return;

    const overlay = new Image();
    overlay.src = new URL('logo.jpg', logo.src).href;
    overlay.alt = '';
    overlay.className = 'logo-hold-overlay';
    overlay.hidden = true;
    overlay.setAttribute('aria-hidden', 'true');
    document.body.appendChild(overlay);

    logo.classList.add('logo-hold-trigger');
    logo.draggable = false;

    let holdTimer;
    let hideTimer;
    let pointerId = null;

    function cancelHold() {
        clearTimeout(holdTimer);
        pointerId = null;
    }

    logo.addEventListener('pointerdown', (event) => {
        if (!event.isPrimary || event.button !== 0 || pointerId !== null) return;
        event.preventDefault();
        if (typeof ResetTimers === 'function') ResetTimers();
        pointerId = event.pointerId;
        holdTimer = setTimeout(() => {
            if (!overlay.complete || overlay.naturalWidth === 0) return;
            overlay.hidden = false;
            clearTimeout(hideTimer);
            hideTimer = setTimeout(() => {
                overlay.hidden = true;
            }, 500);
        }, 10000);
    });

    function endHold(event) {
        if (event.pointerId === pointerId) cancelHold();
    }

    window.addEventListener('pointerup', endHold);
    window.addEventListener('pointercancel', endHold);
    logo.addEventListener('pointerleave', endHold);
    logo.addEventListener('pointermove', (event) => {
        if (event.pointerId !== pointerId) return;
        const bounds = logo.getBoundingClientRect();
        if (event.clientX < bounds.left || event.clientX > bounds.right ||
            event.clientY < bounds.top || event.clientY > bounds.bottom) {
            cancelHold();
        }
    });
    logo.addEventListener('contextmenu', (event) => event.preventDefault());

    function reset() {
        cancelHold();
        clearTimeout(hideTimer);
        overlay.hidden = true;
    }

    window.addEventListener('blur', reset);
    document.addEventListener('visibilitychange', () => {
        if (document.hidden) reset();
    });
})();
