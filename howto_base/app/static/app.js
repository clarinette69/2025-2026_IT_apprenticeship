document.addEventListener('keydown', function (e) {
  if (e.ctrlKey && e.key.toLowerCase() === 'k') {
    e.preventDefault();
    const search = document.getElementById('global-search');
    if (search) search.focus();
  }
  if (e.ctrlKey && e.key.toLowerCase() === 'n') {
    e.preventDefault();
    window.location.href = '/entries/new';
  }
  if (e.ctrlKey && e.key.toLowerCase() === 's') {
    const form = document.getElementById('entry-form');
    if (form) {
      e.preventDefault();
      form.submit();
    }
  }
  if (e.key === 'Escape') {
    const active = document.activeElement;
    if (active) active.blur();
  }
});

async function runStructure() {
  const raw = document.getElementById('rawCapture').value;
  const fd = new FormData();
  fd.append('raw_text', raw);
  const res = await fetch('/capture', { method: 'POST', body: fd });
  const data = await res.json();
  document.getElementById('captureResult').textContent = JSON.stringify(data, null, 2);
}

async function loadEntities() {
  const input = document.getElementById('entityInput');
  if (!input) return;
  input.setAttribute('list', 'entityList');
  input.addEventListener('input', async () => {
    const res = await fetch('/entities?prefix=' + encodeURIComponent(input.value));
    const data = await res.json();
    const dl = document.getElementById('entityList');
    dl.innerHTML = '';
    data.entities.forEach((ent) => {
      const op = document.createElement('option');
      op.value = ent;
      dl.appendChild(op);
    });
  });
}

loadEntities();
