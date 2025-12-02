# Lister SPA

Modern single-page replacement for the old framed `/lister` section.

## Overview

/lister_spa contains everything needed to build and serve the new list experience:

- `index.html` — SPA shell matching the original menu look, renders descriptions + list items.
- `index.json` — machine-readable catalog of all lists, grouped by category.
- `data/` — canonical `.txt` files containing the list items (copied from legacy ASP storage).

Serve this folder via HTTP (e.g. `python3 -m http.server`) to avoid fetch restrictions.

## Regenerate list data

1. Update or add the relevant `.txt` file inside `data/`. The file name should match the `slug` (e.g. `verdt_aa_leve_for.txt`).
2. Edit `index.json` to keep the metadata in sync:
   - `slug`: matches the filename (without `.txt`).
   - `title`: label shown in the menu.
   - `category`: `top`, `middle`, or `bottom` (controls which menu block it appears in).
   - `description`: short blurb shown above the bullet list (plain text).
   - `path`: relative path to the `.txt` file (typically `data/<slug>.txt`).
3. Start a local server and test:
   ```bash
   cd poetikon.no
   python3 -m http.server 8000
   # Visit http://localhost:8000/lister_spa/
   ```

## SPA behaviour

- Menu layout is recreated with the original GIF slices (`../lister/images/*`).
- Selecting a list loads its description from `index.json`, then fetches the full text in this order:
  1. `data/<slug>.txt`
  2. `../asp/<slug>.txt`
  3. `../lister/<slug>.txt`
- Lines that start with “Legg til …” (remnants of old forms) are stripped.
- Each remaining line becomes its own `<li>`, keeping long entries readable.
- Status updates are announced via `aria-live`, so the UI stays visually clean.

## Notes

- `index.html` expects to run over HTTP/HTTPS. `fetch()` will fail on `file://`.
- HTML entity decoding is handled directly in `index.json`, so store Norwegian characters normally.
- If you add new lists, keep both `index.json` and `data/<slug>.txt` in sync, then refresh the browser.
