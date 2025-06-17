'use strict';

// Global state for tracking video playback
const videoStates = new WeakMap();

/**
 * Initialize Ionicons with multiple fallback CDNs
 */
async function loadIonicons() {
  if (window.ioniconsLoaded) return;

  const sources = [
    'https://cdn.jsdelivr.net/npm/ionicons@5.5.2/dist/ionicons/ionicons.esm.js',
    'https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js',
    'https://cdnjs.cloudflare.com/ajax/libs/ionicons/5.5.2/ionicons.esm.js'
  ];

  const loadScript = (src) => new Promise((resolve) => {
    const script = document.createElement('script');
    script.src = src;
    script.type = 'module';
    script.onload = script.onerror = resolve;
    document.head.appendChild(script);
  });

  for (const src of sources) {
    try {
      await loadScript(src);
      await loadScript(src.replace('.esm.js', '.js'));
      window.ioniconsLoaded = true;
      return;
    } catch (e) {
      continue;
    }
  }
  console.warn('Ionicons failed to load from all CDNs');
}

/**
 * Initialize navbar toggle functionality
 */
function initNavbar() {
  const navbar = document.querySelector('[data-navbar]');
  const overlay = document.querySelector('[data-overlay]');
  const openBtn = document.querySelector('[data-menu-open-btn]');
  const closeBtn = document.querySelector('[data-menu-close-btn]');

  if (!navbar || !overlay) return;

  const toggleNav = () => {
    navbar.classList.toggle('active');
    overlay.classList.toggle('active');
    document.body.classList.toggle('active');
  };

  [openBtn, closeBtn, overlay].forEach(el => {
    el?.addEventListener('click', toggleNav);
  });
}

/**
 * Initialize sticky header
 */
function initStickyHeader() {
  const header = document.querySelector('[data-header]');
  if (!header) return;

  let lastScroll = 0;
  window.addEventListener('scroll', () => {
    const currentScroll = window.scrollY;
    header.classList.toggle('active', currentScroll > 10 && currentScroll > lastScroll);
    lastScroll = currentScroll;
  });
}

/**
 * Initialize scroll-to-top button
 */
function initGoToTop() {
  const goTopBtn = document.querySelector('[data-go-top]');
  if (!goTopBtn) return;

  window.addEventListener('scroll', () => {
    goTopBtn.classList.toggle('active', window.scrollY >= 500);
  });

  goTopBtn.addEventListener('click', () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
}

/**
 * Initialize movie cards with video hover effect
 */
async function initMovieCards() {
  const cards = document.querySelectorAll('.movie-card');
  if (!cards.length) return;

  await Promise.all(Array.from(cards).map(async (card) => {
    const banner = card.querySelector('.card-banner');
    const img = banner?.querySelector('img');
    const video = banner?.querySelector('video.card-video');
    
    if (!banner || !img || !video) return;

    // Initialize video state
    videoStates.set(video, {
      isHovering: false,
      playRequested: false,
      hasPlayed: false
    });

    // Configure video element
    video.style.display = 'none';
    video.muted = true;
    video.loop = true;
    video.playsInline = true;
    video.preload = 'metadata';

    // Preload video
    try {
      await video.load();
    } catch (error) {
      console.warn(`Video preload failed for ${video.src}:`, error);
      return;
    }

    // Event handlers
    const handleMouseEnter = async () => {
      const state = videoStates.get(video);
      state.isHovering = true;
      
      try {
        if (video.readyState < 2) await video.load();
        
        state.playRequested = true;
        video.style.display = 'block';
        img.style.opacity = '0';
        video.currentTime = 0;
        
        const playPromise = video.play();
        
        if (playPromise !== undefined) {
          await playPromise
            .then(() => {
              state.playRequested = false;
              state.hasPlayed = true;
            })
            .catch(error => {
              state.playRequested = false;
              if (error.name !== 'AbortError') {
                console.warn('Video playback failed:', error);
                resetToImage(video, img);
              }
            });
        }
      } catch (error) {
        videoStates.get(video).playRequested = false;
        console.warn('Video play error:', error);
        resetToImage(video, img);
      }
    };

    const handleMouseLeave = () => {
      const state = videoStates.get(video);
      state.isHovering = false;
      
      if (!state.playRequested && !video.paused) {
        video.pause();
        resetToImage(video, img);
      }
    };

    const handleVideoEnd = () => {
      const state = videoStates.get(video);
      if (!state.isHovering) {
        resetToImage(video, img);
      }
    };

    const handleVisibilityChange = () => {
      if (document.hidden && !video.paused) {
        video.pause();
      }
    };

    // Add event listeners
    card.addEventListener('mouseenter', handleMouseEnter, { passive: true });
    card.addEventListener('mouseleave', handleMouseLeave, { passive: true });
    video.addEventListener('ended', handleVideoEnd);
    video.addEventListener('pause', () => {
      const state = videoStates.get(video);
      if (state.isHovering && state.playRequested && !video.paused) {
        video.play().catch(() => resetToImage(video, img));
      }
    });
    document.addEventListener('visibilitychange', handleVisibilityChange);
  }));
}

function resetToImage(video, img) {
  video.style.display = 'none';
  img.style.opacity = '1';
}

/**
 * Load dynamic movie details from URL parameters
 */
function loadMovieDetails() {
  const urlParams = new URLSearchParams(window.location.search);
  if (!urlParams.size) return;

  const setContent = (selector, content, isHtml = false) => {
    document.querySelectorAll(selector).forEach(el => {
      if (isHtml) el.innerHTML = content;
      else el.textContent = content;
    });
  };

  try {
    // Update title
    if (urlParams.get('title')) {
      const title = decodeURIComponent(urlParams.get('title').replace(/\+/g, ' '));
      setContent('#detail-title, .detail-title', title);
      document.title = `${title} | Movie Hub`;
    }

    // Update other details...
    if (urlParams.get('year')) setContent('#detail-year, time[datetime]', urlParams.get('year'));
    if (urlParams.get('duration')) {
      const duration = urlParams.get('duration') === 'N/A' ? 'N/A' : `${urlParams.get('duration')} min`;
      setContent('#detail-duration, time[datetime="PT115M"]', duration);
    }
    if (urlParams.get('image')) {
      const imgPath = `./assets/images/${decodeURIComponent(urlParams.get('image').replace(/\+/g, ' '))}`;
      document.querySelectorAll('#detail-poster, .movie-detail-banner img').forEach(img => {
        img.src = imgPath;
        img.alt = `${decodeURIComponent(urlParams.get('title')?.replace(/\+/g, ' ')) || 'Movie'} poster`;
      });
      document.querySelectorAll('#detail-download, .download-btn').forEach(link => {
        link.href = imgPath;
      });
    }
    if (urlParams.get('genre')) {
      document.querySelectorAll('#detail-genres, .ganre-wrapper').forEach(wrapper => {
        wrapper.innerHTML = '';
        decodeURIComponent(urlParams.get('genre')).split(',').forEach((genre, i, arr) => {
          const link = document.createElement('a');
          link.href = '#';
          link.textContent = genre.trim();
          wrapper.appendChild(link);
          if (i < arr.length - 1) wrapper.append(', ');
        });
      });
    }
    if (urlParams.get('storyline')) {
      setContent('#detail-storyline, .storyline', decodeURIComponent(urlParams.get('storyline').replace(/\+/g, ' ')));
    }
    if (urlParams.get('rating')) {
      setContent('.rating data, .card-meta .rating data', urlParams.get('rating'));
    }
  } catch (error) {
    console.error('Error loading movie details:', error);
  }
}

/**
 * Main initialization
 */
document.addEventListener('DOMContentLoaded', async () => {
  try {
    await loadIonicons();
    initNavbar();
    initStickyHeader();
    initGoToTop();
    await initMovieCards();
    loadMovieDetails();
  } catch (error) {
    console.error('Initialization error:', error);
  }
});