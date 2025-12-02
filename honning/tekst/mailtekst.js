
var state=1;

function next() {

  if (state == 1) {
    if (document.layers) {
      document.a001.visibility = "hide";
      document.a002.visibility = "show";
      state = 2;
      return;
    }
  }
  if (state == 2) {
    if (document.layers) {
      document.a002.visibility = "hide";
      document.a003.visibility = "show";
      state = 3;
      return;
    }
  }

  if (state == 3) {
    if (document.layers) {
      document.a003.visibility = "hide";
      document.a004.visibility = "show";
      state = 4;
      return;
    }
  }
  if (state == 4) {
    if (document.layers) {
      document.a004.visibility = "hide";
      document.a005.visibility = "show";
      state = 5;
      return;
    }
  }
  if (state == 5) {
    if (document.layers) {
      document.a005.visibility = "hide";
      document.a006.visibility = "show";
      state = 6;
      return;
    }
  }

}
