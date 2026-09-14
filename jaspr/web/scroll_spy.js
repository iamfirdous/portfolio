(function() {
  function initScrollSpy() {
    var sections = document.querySelectorAll('section[id]');
    var navLinks = document.querySelectorAll('.nav-link');
    if (!sections.length || !navLinks.length) {
      setTimeout(initScrollSpy, 100);
      return;
    }

    var observer = new IntersectionObserver(function(entries) {
      entries.forEach(function(entry) {
        if (entry.isIntersecting) {
          var currentId = entry.target.getAttribute('id');
          navLinks.forEach(function(link) {
            var href = link.getAttribute('href');
            if (href === '#' + currentId) {
              link.classList.add('active');
            } else {
              link.classList.remove('active');
            }
          });
        }
      });
    }, {
      rootMargin: '-20% 0px -65% 0px',
      threshold: 0.05
    });

    sections.forEach(function(section) {
      observer.observe(section);
    });

    // Check on initial load
    var hash = window.location.hash;
    if (hash) {
      var target = document.querySelector(hash);
      if (target) {
        target.scrollIntoView({ behavior: 'smooth' });
      }
    }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initScrollSpy);
  } else {
    initScrollSpy();
  }

  // Copy Email to Clipboard helper
  window.copyEmailToClipboard = function(btn) {
    var email = 'thisisfirdous@gmail.com';
    function markCopied() {
      if (!btn) return;
      btn.classList.add('copied');
      setTimeout(function() {
        btn.classList.remove('copied');
      }, 2000);
    }

    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(email).then(markCopied).catch(function() {
        fallbackCopy(email, markCopied);
      });
    } else {
      fallbackCopy(email, markCopied);
    }
  };

  function fallbackCopy(text, callback) {
    try {
      var ta = document.createElement('textarea');
      ta.value = text;
      ta.style.position = 'fixed';
      ta.style.opacity = '0';
      document.body.appendChild(ta);
      ta.select();
      document.execCommand('copy');
      document.body.removeChild(ta);
      callback();
    } catch (e) {
      console.error('Copy failed', e);
    }
  }

  document.addEventListener('click', function(e) {
    var btn = e.target.closest('#copy-email-btn, .contact-copy-btn');
    if (btn) {
      window.copyEmailToClipboard(btn);
    }
  });

  // Lightbox Modal logic for mobile photo preview
  var activeTrigger = null;

  function openLightbox(src, caption, triggerEl) {
    var modal = document.getElementById('image-lightbox');
    var img = document.getElementById('lightbox-img');
    var captionEl = document.getElementById('lightbox-caption');
    if (!modal || !img) return;

    activeTrigger = triggerEl || document.activeElement;

    img.src = src;
    img.alt = caption || 'Photo preview';
    if (captionEl) {
      captionEl.textContent = caption || '';
      captionEl.style.display = caption ? 'block' : 'none';
    }

    modal.classList.add('active');
    modal.setAttribute('aria-hidden', 'false');
    document.body.classList.add('lightbox-open');

    var closeBtn = modal.querySelector('.lightbox-close-btn');
    if (closeBtn) {
      setTimeout(function() {
        closeBtn.focus();
      }, 50);
    }
  }

  function closeLightbox() {
    var modal = document.getElementById('image-lightbox');
    if (!modal || !modal.classList.contains('active')) return;

    modal.classList.remove('active');
    modal.setAttribute('aria-hidden', 'true');
    document.body.classList.remove('lightbox-open');

    var img = document.getElementById('lightbox-img');
    if (img) {
      setTimeout(function() {
        if (!modal.classList.contains('active')) {
          img.src = '';
        }
      }, 250);
    }

    if (activeTrigger && typeof activeTrigger.focus === 'function') {
      activeTrigger.focus();
      activeTrigger = null;
    }
  }

  window.openLightbox = openLightbox;
  window.closeLightbox = closeLightbox;

  document.addEventListener('click', function(e) {
    // Lightbox close button
    if (e.target.closest('.lightbox-close-btn')) {
      e.preventDefault();
      closeLightbox();
      return;
    }

    // Tap outside the image content to dismiss
    var modal = document.getElementById('image-lightbox');
    if (modal && modal.classList.contains('active')) {
      if (!e.target.closest('.lightbox-content')) {
        e.preventDefault();
        closeLightbox();
      }
      return;
    }

    // If click was on an anchor link, let default navigation proceed
    if (e.target.closest('a')) return;

    // Whole card or photo button click trigger (for cards with preview images)
    var trigger = e.target.closest('.project-row[data-lightbox-src], .additional-card[data-lightbox-src], .mobile-photo-btn');
    if (trigger) {
      var src = trigger.getAttribute('data-lightbox-src');
      var caption = trigger.getAttribute('data-lightbox-caption');
      if (src) {
        e.preventDefault();
        e.stopPropagation();
        openLightbox(src, caption, trigger);
      }
      return;
    }
  });

  // Keyboard accessibility: Escape to dismiss, Tab focus trap inside modal
  document.addEventListener('keydown', function(e) {
    var modal = document.getElementById('image-lightbox');
    if (!modal || !modal.classList.contains('active')) return;

    if (e.key === 'Escape' || e.keyCode === 27) {
      e.preventDefault();
      closeLightbox();
      return;
    }

    if (e.key === 'Tab') {
      var focusable = modal.querySelectorAll('button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])');
      if (!focusable.length) return;
      var first = focusable[0];
      var last = focusable[focusable.length - 1];
      if (e.shiftKey) {
        if (document.activeElement === first) {
          e.preventDefault();
          last.focus();
        }
      } else {
        if (document.activeElement === last) {
          e.preventDefault();
          first.focus();
        }
      }
    }
  });
})();
