(function() {
  function init(container) {
    const file = container.getAttribute('data-words');
    const width = parseInt(container.getAttribute('data-width'), 10) || 800;
    const height = parseInt(container.getAttribute('data-height'), 10) || 300;

    fetch(file)
      .then((res) => res.json())
      .then((words) => {
        if (!Array.isArray(words)) return;
        render(container, words.map(String), width, height);
      })
      .catch((err) => {
        container.textContent = 'Kunne ikke laste magnet-ord.';
        console.error(err);
      });
  }

  function render(container, words, width, height) {
    container.style.position = 'relative';
    container.style.width = '100%';
    container.style.maxWidth = width + 'px';
    container.style.height = height + 'px';
    container.style.border = '1px solid #999';
    container.style.background = '#fdfdfd';
    container.style.overflow = 'hidden';

    words.forEach((word, idx) => {
      const label = document.createElement('div');
      label.className = 'magnet-word';
      label.textContent = word;
      label.style.position = 'absolute';
      label.style.padding = '4px 10px';
      label.style.border = '1px solid #333';
      label.style.background = '#fff';
      label.style.fontFamily = 'Courier New, monospace';
      label.style.fontSize = '14px';
      label.style.cursor = 'grab';
      label.style.userSelect = 'none';
      label.style.whiteSpace = 'nowrap';
      label.style.transform = 'translate(-50%, -50%)';

      const angle = (idx / words.length) * Math.PI * 2;
      const radius = Math.min(width, height) / 2.5;
      const cx = width / 2 + Math.cos(angle) * radius * Math.random();
      const cy = height / 2 + Math.sin(angle) * radius * Math.random();
      label.style.left = cx + 'px';
      label.style.top = cy + 'px';

      enableDrag(label, container);
      container.appendChild(label);
    });
  }

  function enableDrag(el, bounds) {
    let active = false;
    let offsetX = 0;
    let offsetY = 0;

    el.addEventListener('pointerdown', (evt) => {
      active = true;
      el.setPointerCapture(evt.pointerId);
      el.style.cursor = 'grabbing';
      const rect = el.getBoundingClientRect();
      offsetX = evt.clientX - rect.left;
      offsetY = evt.clientY - rect.top;
    });

    el.addEventListener('pointermove', (evt) => {
      if (!active) return;
      const bRect = bounds.getBoundingClientRect();
      const x = evt.clientX - bRect.left - offsetX + el.offsetWidth / 2;
      const y = evt.clientY - bRect.top - offsetY + el.offsetHeight / 2;
      const margin = 10;
      const maxX = bounds.clientWidth - margin;
      const maxY = bounds.clientHeight - margin;
      const clampedX = Math.max(margin, Math.min(maxX, x));
      const clampedY = Math.max(margin, Math.min(maxY, y));
      el.style.left = clampedX + 'px';
      el.style.top = clampedY + 'px';
    });

    function endDrag(evt) {
      if (active) {
        active = false;
        el.releasePointerCapture(evt.pointerId);
        el.style.cursor = 'grab';
      }
    }

    el.addEventListener('pointerup', endDrag);
    el.addEventListener('pointerleave', () => { active = false; el.style.cursor = 'grab'; });
  }

  document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('[data-magnet-poetry]').forEach(init);
  });
})();
