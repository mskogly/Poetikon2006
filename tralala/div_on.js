function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);



var IE4 = (document.all) ? true : false;
var NS4 = (document.layers) ? true : false;
var flag = false;
var visdiv = 'blank';

function show_div(div) {
   setVisibility(visdiv,false);
   visdiv = div;
   setVisibility(div,true);
}

function setVisibility(id, flag) {
	if (NS4) {
		var str = (flag) ? 'show' : 'hide';
		eval("document." + id).visibility = str;
	} else {
		var str = (flag) ? 'visible' : 'hidden';
		eval("document.all." + id).style.visibility = str;
	}
}


function img_act (imgName) {
	if (!flag) {
		return;
	}
	imgOn = eval(imgName + "red.src");
	if (IE4) {
		document [imgName].src = imgOn;
	} else if (NS4) {
		document.layers[imgName].document[imgName].src = imgOn;
	}
}

function box_act (box, imgName) {
	if (!flag) {
		return;
	}
	imgOn = eval(box + imgName + ".src");
	if (IE4) {
		document [box].src = imgOn;
	} else if (NS4) {
		document.layers[box].document[box].src = imgOn;
	}
}

function img_inact (imgName) {
	if (!flag) {
		return;
	}
	imgOff = eval (imgName + "off.src");
	if (IE4) {
		document [imgName].src = imgOff;
	} else if (NS4) {
		document.layers[imgName].document[imgName].src = imgOff;
	}
}
var meta;
function close() {
	if ((meta) && (!meta.closed)) {
		meta.close();
	}
}




