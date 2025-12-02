# Poetikon Flash Player Migration — Project Status

## Overview
Converting Poetikon (early 2000s Flash art site) to a static HTML frameset with Ruffle Flash emulation. Goal: randomly load archived SWF files on page load via the frameset middle frame.

## Current Architecture

### Frameset Structure (`index.html`)
- **Top frame:** `topp2.html` (navigation bar with logo & links)
- **Middle frame:** `random-flash.html` (loads random SWF on page load)
- **Bottom frame:** `bunnmeny.html` (bottom icon menu)

### Flash Files
- **Location:** `/poetikon.no/flash/` (60+ SWF files)
- **Key files:** `potet.swf`, `neseblod.swf`, `01.swf` through `waterfallEngine.swf`
- **File moved:** `november/neseblod.swf` → `flash/neseblod.swf` (completed)

### Ruffle Integration
- **CDN Script:** `https://unpkg.com/@ruffle-rs/ruffle`
- **API Used:** `window.RufflePlayer.newest().createPlayer()` + `player.ruffle().load(swfPath)`
- **Limitation:** Requires HTTP (not file://) due to WASM/XHR security policies

## Completed Tasks
✅ Audited frameset files and verified structure
✅ Converted 54+ root-absolute links (`/path`) to depth-correct relative paths across entire repo
✅ Moved `neseblod.swf` from `november/` to `flash/`
✅ Created `random-flash.js` with SWF selection logic (60+ file array)
✅ Created `random-flash.html` with dynamic Ruffle player + retry logic + console logging
✅ Updated `index.html` frameset to load `random-flash.html` in middle frame
✅ Created `flashtest.html` (single SWF test page using Ruffle JS API)

## Current Issue
**SWF files not loading in browser** (no network requests to `flash/*.swf`)

### Root Cause (Identified)
- Ruffle requires HTTP protocol; file:// blocks WASM module and XHR/fetch
- Static `<ruffle-embed>` and direct `src` attribute setting may not trigger load
- Ruffle JS API (`createPlayer()` + `load()`) more reliable than HTML element

### Files to Test on HTTP Server
1. **`flashtest.html`** — Single SWF test (simplest case)
   - Opens: http://localhost:8002/flashtest.html
   - Expected: `flash/potet.swf` loads and plays in black box
   - Console should show: `[flashtest] RufflePlayer available, creating player`

2. **`random-flash.html`** — Random SWF loader (integrated feature)
   - Used inside frameset via `index.html`
   - Opens: http://localhost:8002/index.html
   - Expected: Random SWF plays in middle frame

## How to Test After Reboot

### Step 1: Start HTTP Server
From the `poetikon.no` folder:
```bash
cd /Users/morten.skogly/Dropbox/Projects/Poetikon-ASP-to-Static-2025-1/poetikon.no
python3 -m http.server 8002
```
Or try port 8000 or 8001 if 8002 is occupied.

### Step 2: Open Browser
- **For SWF test:** http://localhost:8002/flashtest.html
- **For frameset:** http://localhost:8002/index.html

### Step 3: Inspect
- **DevTools → Network:** Look for request to `flash/potet.swf` (status 200)
- **DevTools → Console:** Check for logs starting with `[flashtest]` or `[random-flash]`
- **Common errors:**
  - "CORS/fetch not allowed" — normal for file://, will work on HTTP
  - "ruffle-embed not defined after retries" — Ruffle script didn't load from CDN
  - "Cannot load SWF" — file path wrong or SWF corrupted

## Key Files

| File | Purpose | Status |
|------|---------|--------|
| `index.html` | Main frameset | ✅ Updated to use `random-flash.html` in middle frame |
| `random-flash.html` | Random SWF loader | ✅ Uses Ruffle JS API with retries + logging |
| `flashtest.html` | Single SWF test | ✅ Simplified test case |
| `topp2.html` | Top nav | ✅ All links converted to relative |
| `bunnmeny.html` | Bottom menu | ✅ All links converted to relative |
| `random-flash.js` | (unused) JS library | Created but moved logic inline |

## Next Steps if SWF Still Won't Load After HTTP Reboot

### Option 1: Fetch + Blob Fallback
If Ruffle's `load()` method doesn't fetch the SWF, add:
```javascript
fetch('flash/potet.swf')
  .then(r => r.blob())
  .then(blob => {
    var url = URL.createObjectURL(blob);
    player.ruffle().load(url);
  });
```

### Option 2: Check Ruffle CDN
Verify the Ruffle script loads from unpkg:
- Open DevTools → Network
- Search for "ruffle" requests
- If no request to `unpkg.com/@ruffle-rs/ruffle`, CDN failed — try alternate CDN

### Option 3: Ruffle <embed> Fallback
If JS API fails, revert to `<ruffle-embed>` HTML element with static `src`:
```html
<ruffle-embed src="flash/potet.swf" width="750" height="550"></ruffle-embed>
```

## Ruffle Documentation
- Official: https://ruffle.rs/
- Unpkg CDN: https://unpkg.com/@ruffle-rs/ruffle
- Local setup in `FLASH_README.md`

## Directory Structure (Relevant Paths)
```
poetikon.no/
  index.html                 (frameset root)
  topp2.html                 (top frame nav)
  bunnmeny.html              (bottom frame menu)
  random-flash.html          (middle frame — random SWF loader)
  flashtest.html             (test page for single SWF)
  random-flash.js            (SWF list + functions — unused, moved inline)
  poetikon.css               (stylesheet)
  flash/
    01.swf through waterfallEngine.swf (60+ SWF files)
    neseblod.swf             (moved from november/)
    panorama360-facesfromtempfolder.swf
    ... (other SWF files)
```

## Console Logging Prefixes
Look for these in DevTools → Console:
- `[flashtest]` — from `flashtest.html`
- `[random-flash]` — from `random-flash.html`
- Ruffle messages (info/warnings from the CDN library)

## Links Converted
**54+ files updated** with depth-correct relative paths. Examples:
- `/poetikon.css` → `../poetikon.css` (from depth 1)
- `/index.html` → `../../../index.html` (from depth 3)
- Root-level `/` removed; all leading slashes replaced with `../` chain

---

**Last Updated:** 2025-11-29
**Status:** Awaiting HTTP server reboot test
**Blocker:** SWF not loading; Ruffle requires HTTP protocol (not file://)
