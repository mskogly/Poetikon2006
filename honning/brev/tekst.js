
var state=1;

function next() {

  if (state == 1) {
    if (document.layers) {
      document.aaa.visibility = "hide";
      document.bbb.visibility = "show";
      state = 2;
      return;
    }
    if (document.all) {
      aaa.style.visibility = "hidden";
      bbb.style.visibility = "visible";
      state = 2;
      return;
    }
  }
  if (state == 2) {
    if (document.layers) {
      document.bbb.visibility = "hide";
      document.ccc.visibility = "show";
      state = 3;
      return;
    }
    if (document.all) {
      bbb.style.visibility = "hidden";
      ccc.style.visibility = "visible";
      state = 3;
      return;
    }
  }
  if (state == 3) {
    if (document.layers) {
      document.ccc.visibility = "hide";
      document.ddd.visibility = "show";
      state = 4;
      return;
    }
    if (document.all) {
      ccc.style.visibility = "hidden";
      ddd.style.visibility = "visible";
      state = 4;
      return;
    }
  }
  if (state == 4) {
    if (document.layers) {
      document.ddd.visibility = "hide";
      document.eee.visibility = "show";
      state = 5;
      return;
    }
    if (document.all) {
      ddd.style.visibility = "hidden";
      eee.style.visibility = "visible";
      state = 5;
      return;
    }
  }
  if (state == 5) {
    if (document.layers) {
      document.eee.visibility = "hide";
      document.fff.visibility = "show";
      state = 6;
      return;
    }
    if (document.all) {
      eee.style.visibility = "hidden";
      fff.style.visibility = "visible";
      state = 6;
      return;
    }
  }
  if (state == 6) {
    if (document.layers) {
      document.fff.visibility = "hide";
      document.ggg.visibility = "show";
      state = 7;
      return;
    }
    if (document.all) {
      fff.style.visibility = "hidden";
      ggg.style.visibility = "visible";
      state = 7;
      return;
    }
  }
  if (state == 7) {
    if (document.layers) {
      document.ggg.visibility = "hide";
      document.hhh.visibility = "show";
      state = 8;
      return;
    }
    if (document.all) {
      ggg.style.visibility = "hidden";
      hhh.style.visibility = "visible";
      state = 8;
      return;
    }
  }

  if (state == 8) {
    if (document.layers) {
      document.hhh.visibility = "hide";
      document.iii.visibility = "show";
      state = 9;
      return;
    }
    if (document.all) {
      hhh.style.visibility = "hidden";
      iii.style.visibility = "visible";
      state = 9;
      return;
    }
  }


}
