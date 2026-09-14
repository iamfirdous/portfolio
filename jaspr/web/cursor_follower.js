/**
 * Interactive Accent Cursor Follower & Floating Project Preview
 * Designed for Firdous Ismail's Jaspr Portfolio
 */

(function () {
  // Disable on touch / mobile devices
  if (window.matchMedia && window.matchMedia('(pointer: coarse)').matches) {
    return;
  }

  // Create cursor follower DOM elements
  const dot = document.createElement('div');
  dot.className = 'cursor-dot';

  const ring = document.createElement('div');
  ring.className = 'cursor-ring';

  document.body.appendChild(dot);
  document.body.appendChild(ring);

  let mouseX = -100;
  let mouseY = -100;
  let ringX = -100;
  let ringY = -100;
  let isVisible = false;
  let isHovered = false;

  // Track mouse coordinates
  window.addEventListener('mousemove', (e) => {
    mouseX = e.clientX;
    mouseY = e.clientY;

    if (!isVisible) {
      isVisible = true;
      dot.style.opacity = '1';
      ring.style.opacity = '1';
    }

    // Direct position for instant responsiveness on the core dot
    dot.style.transform = `translate3d(${mouseX - 3}px, ${mouseY - 3}px, 0)`;
  });

  document.addEventListener('mouseleave', () => {
    isVisible = false;
    dot.style.opacity = '0';
    ring.style.opacity = '0';
  });

  // Smooth lerp loop for the glowing trailing ring
  function render() {
    if (isVisible) {
      // Lerp smoothing factor 0.18 for fluid responsiveness
      ringX += (mouseX - ringX) * 0.18;
      ringY += (mouseY - ringY) * 0.18;

      const scale = isHovered ? 1.5 : 1;
      ring.style.transform = `translate3d(${ringX - 14}px, ${ringY - 14}px, 0) scale(${scale})`;
    }
    requestAnimationFrame(render);
  }
  requestAnimationFrame(render);

  // Hook interactive elements for cursor magnet / hover scaling
  function setupHoverListeners() {
    const interactiveSelectors = 'a, button, .project-row, .additional-card, .social-icon-btn, .nav-link, .brand-pill, .resume-download-btn';
    
    document.body.addEventListener('mouseover', (e) => {
      const target = e.target.closest(interactiveSelectors);
      if (target) {
        isHovered = true;
        ring.classList.add('cursor-hover');
      }
    });

    document.body.addEventListener('mouseout', (e) => {
      const target = e.target.closest(interactiveSelectors);
      if (target) {
        isHovered = false;
        ring.classList.remove('cursor-hover');
      }
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', setupHoverListeners);
  } else {
    setupHoverListeners();
  }
})();
