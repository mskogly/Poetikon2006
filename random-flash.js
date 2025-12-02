// Random Flash File Loader
// Loads a random SWF from the flash/ folder and displays it using Ruffle

var flashFiles = [
  "01.swf",
  "02.swf",
  "03.swf",
  "04.swf",
  "05.swf",
  "06.swf",
  "07.swf",
  "9.swf",
  "abs01.swf",
  "avoid1.swf",
  "bg1.swf",
  "blaasnakkendefisk.swf",
  "blackdot.swf",
  "blad.swf",
  "blomster.swf",
  "bokstavlek.swf",
  "ching.swf",
  "cubes.swf",
  "dill.swf",
  "drummer.swf",
  "easysketch.swf",
  "evillotus.swf",
  "fineord.swf",
  "finfigur.swf",
  "fingerinavlen.swf",
  "flashteroids.swf",
  "flowergirl.swf",
  "flymetothemoon.swf",
  "fogcrows.swf",
  "foodispoetry.swf",
  "fot_og_dikt.swf",
  "goa.swf",
  "goforit.swf",
  "gs.swf",
  "kjaerlighetens_dyp.swf",
  "landskap.swf",
  "lemonboy.swf",
  "lemonde.swf",
  "lines.swf",
  "luv.swf",
  "mandala1.swf",
  "mandala_2.swf",
  "moff.swf",
  "neseblod.swf",
  "nibbles.swf",
  "ok.swf",
  "panorama360-facesfromtempfolder.swf",
  "particles2a.swf",
  "platespillerting.swf",
  "poetikonfineordfractal.swf",
  "potet.swf",
  "puppedame.swf",
  "pupperadar.swf",
  "push.swf",
  "pxlppl.swf",
  "red.swf",
  "rosa.swf",
  "rustvegg.swf",
  "shape2b.swf",
  "sherwoodhamill-ninna rug.swf",
  "sne.swf",
  "snurrig.swf",
  "togvindu.swf",
  "trafikkstor.swf",
  "tyggistyggendedame.swf",
  "univers.swf",
  "waterfallEngine.swf"
];

// Get a random SWF file
function getRandomFlash() {
  var randomIndex = Math.floor(Math.random() * flashFiles.length);
  return flashFiles[randomIndex];
}

// Load random flash file into the player
function loadRandomFlash() {
  var randomFile = getRandomFlash();
  var playerUrl = "flash-player.html?file=flash/" + encodeURIComponent(randomFile);
  
  // If in a frame, load into main frame
  if (parent && parent.main) {
    parent.main.location.href = playerUrl;
  } else {
    // Otherwise load in current window
    window.location.href = playerUrl;
  }
}

// Display random flash inline (for single-page layouts)
function displayRandomFlashInline(containerId) {
  var randomFile = getRandomFlash();
  var container = document.getElementById(containerId);
  
  if (container) {
    container.innerHTML = '<ruffle-embed src="flash/' + randomFile + '" width="100%" height="600"></ruffle-embed>';
  }
}
