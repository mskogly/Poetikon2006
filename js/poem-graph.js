(function() {
  function parseEdges(str, nodes) {
    const edges = [];
    if (!str) return edges;
    str.split(',').forEach(segment => {
      const chunk = segment.trim();
      if (!chunk) return;
      const parts = chunk.split('-');
      if (parts.length === 2 && parts[0] && parts[1]) {
        edges.push({ source: parts[0], target: parts[1] });
        nodes.add(parts[0]);
        nodes.add(parts[1]);
      } else {
        nodes.add(chunk);
      }
    });
    return edges;
  }

  function buildGraph(el) {
    const width = parseInt(el.getAttribute('data-width'), 10) || 500;
    const height = parseInt(el.getAttribute('data-height'), 10) || 400;
    const center = el.getAttribute('data-center') || '';
    const nodesSet = new Set();
    const edgesRaw = parseEdges(el.getAttribute('data-edges') || '', nodesSet);

    if (nodesSet.size === 0) {
      el.innerHTML = '<p style="color:#fff">Ingen data</p>';
      return;
    }

    const nodes = Array.from(nodesSet).map(name => ({
      name,
      x: width / 2 + (Math.random() - 0.5) * 100,
      y: height / 2 + (Math.random() - 0.5) * 100,
      vx: 0,
      vy: 0,
      isCenter: name === center
    }));

    const nodeMap = Object.create(null);
    nodes.forEach(n => { nodeMap[n.name] = n; });

    const edges = edgesRaw
      .map(({ source, target }) => ({ source: nodeMap[source], target: nodeMap[target] }))
      .filter(e => e.source && e.target);

    const canvas = document.createElement('canvas');
    canvas.width = width;
    canvas.height = height;
    canvas.style.width = '100%';
    canvas.style.height = '100%';
    canvas.className = 'poem-graph-canvas';
    el.innerHTML = '';
    el.appendChild(canvas);
    const ctx = canvas.getContext('2d');

    const REPULSION = 9000;
    const SPRING = 0.005;
    const SPRING_LENGTH = Math.min(width, height) / 4;
    const DAMPING = 0.85;

    function step() {
      for (let i = 0; i < nodes.length; i++) {
        const a = nodes[i];
        for (let j = i + 1; j < nodes.length; j++) {
          const b = nodes[j];
          let dx = a.x - b.x;
          let dy = a.y - b.y;
          let distSq = dx * dx + dy * dy + 0.01;
          let force = REPULSION / distSq;
          let dist = Math.sqrt(distSq);
          dx /= dist;
          dy /= dist;
          a.vx += dx * force;
          a.vy += dy * force;
          b.vx -= dx * force;
          b.vy -= dy * force;
        }
      }

      edges.forEach(edge => {
        const source = edge.source;
        const target = edge.target;
        let dx = target.x - source.x;
        let dy = target.y - source.y;
        let dist = Math.sqrt(dx * dx + dy * dy) || 0.001;
        const force = SPRING * (dist - SPRING_LENGTH);
        dx /= dist;
        dy /= dist;
        source.vx += dx * force;
        source.vy += dy * force;
        target.vx -= dx * force;
        target.vy -= dy * force;
      });

      nodes.forEach(node => {
        if (!node.fixed) {
          node.vx *= DAMPING;
          node.vy *= DAMPING;
          node.x += node.vx;
          node.y += node.vy;
        }
        const margin = 40;
        if (node.x < margin) node.vx += (margin - node.x) * 0.05;
        if (node.x > width - margin) node.vx -= (node.x - (width - margin)) * 0.05;
        if (node.y < margin) node.vy += (margin - node.y) * 0.05;
        if (node.y > height - margin) node.vy -= (node.y - (height - margin)) * 0.05;
      });
    }

    function draw() {
      ctx.save();
      ctx.clearRect(0, 0, width, height);
      ctx.strokeStyle = 'rgba(255,255,255,0.35)';
      ctx.lineWidth = 1;
      edges.forEach(({ source, target }) => {
        ctx.beginPath();
        ctx.moveTo(source.x, source.y);
        ctx.lineTo(target.x, target.y);
        ctx.stroke();
      });
      ctx.font = '22px "Courier New", monospace';
      ctx.textBaseline = 'middle';
      ctx.textAlign = 'left';
      ctx.textBaseline = 'middle';
      ctx.textAlign = 'left';
      nodes.forEach(node => {
        ctx.beginPath();
        ctx.fillStyle = node.isCenter ? '#ffdea1' : '#ffffff';
        ctx.arc(node.x, node.y, node.isCenter ? 7 : 5, 0, Math.PI * 2);
        ctx.fill();
        ctx.fillStyle = '#ffdfa0';
        ctx.fillText(node.name, node.x + 16, node.y);
      });
      ctx.restore();
    }


    let dragging = null;
    let offsetX = 0;
    let offsetY = 0;

    canvas.addEventListener('pointerdown', (evt) => {
      const rect = canvas.getBoundingClientRect();
      const x = (evt.clientX - rect.left) * (canvas.width / rect.width);
      const y = (evt.clientY - rect.top) * (canvas.height / rect.height);
      for (const node of nodes) {
        const dx = x - node.x;
        const dy = y - node.y;
        if (Math.sqrt(dx * dx + dy * dy) < 12) {
          dragging = node;
          node.fixed = true;
          offsetX = dx;
          offsetY = dy;
          canvas.setPointerCapture(evt.pointerId);
          break;
        }
      }
    });

    canvas.addEventListener('pointermove', (evt) => {
      if (!dragging) return;
      const rect = canvas.getBoundingClientRect();
      const x = (evt.clientX - rect.left) * (canvas.width / rect.width);
      const y = (evt.clientY - rect.top) * (canvas.height / rect.height);
      dragging.x = x - offsetX;
      dragging.y = y - offsetY;
      dragging.vx = dragging.vy = 0;
    });

    canvas.addEventListener('pointerup', (evt) => {
      if (dragging) {
        dragging.fixed = false;
        dragging = null;
      }
      canvas.releasePointerCapture(evt.pointerId);
    });

    canvas.addEventListener('pointerleave', () => {
      if (dragging) dragging.fixed = false;
      dragging = null;
    });

    function animate() {
      step();
      draw();
      requestAnimationFrame(animate);
    }
    animate();
  }

  document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('[data-poem-graph]').forEach(buildGraph);
  });
})();
