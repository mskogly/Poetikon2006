
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

function precache() {
	waroff = new Image;
	warred = new Image;
	riotoff = new Image;
	riotred = new Image;
	musicoff = new Image;
	musicred = new Image;
	fashionoff = new Image;
	fashionred = new Image;
	traveloff = new Image;
	travelred = new Image;
	filmoff = new Image;
	filmred = new Image;
	sexoff = new Image;
	sexred = new Image;
	jobsoff = new Image;
	jobsred = new Image;
	designoff = new Image;
	designred = new Image;
	gamesoff = new Image;
	gamesred = new Image;
	artoff = new Image;
	artred = new Image;
	literatureoff = new Image;
	literaturered = new Image;
	sportsoff = new Image;
	sportsred = new Image;
	humoroff = new Image;
	humorred = new Image;
	internoff = new Image;
	internred = new Image;
	emailmeoff = new Image;
	emailmered = new Image;
	clickhereoff = new Image;
	clickherered = new Image;
	contactusoff = new Image;
	contactusred = new Image;
	partneroff = new Image;
	partnerred = new Image;
	sitesoff = new Image;
	sitesmusic = new Image;
	sitesfashion = new Image;
	sitestravel = new Image;
	sitesfilm = new Image;
	sitessex = new Image;
	sitesjobs = new Image;
	sitesdesign = new Image;
	sitesgames = new Image;
	sitesart = new Image;
	sitesliterature = new Image;
	sitessports = new Image;
	siteshumor = new Image;
	featuresoff = new Image;
	featureswar = new Image;
	featuresriot = new Image;
	communityoff = new Image;
	communityintern = new Image;
	communitycontactus = new Image;
	communitywhat = new Image;
	whatoff = new Image;
	whatred = new Image;
	waroff.src = "./images/features/war.gif";
	warred.src = "./images/features/warred.gif";
	riotoff.src = "./images/features/riot.gif";
	riotred.src = "./images/features/riotred.gif";
	musicoff.src = "./images/menu/music.gif";
	musicred.src = "./images/menu/musicred.gif";
	fashionoff.src = "./images/menu/fashion.gif";
	fashionred.src = "./images/menu/fashionred.gif";
	traveloff.src = "./images/menu/travel.gif";
	travelred.src = "./images/menu/travelred.gif";
	filmoff.src = "./images/menu/film.gif";
	filmred.src = "./images/menu/filmred.gif";
	sexoff.src = "./images/menu/sex.gif";
	sexred.src = "./images/menu/sexred.gif";
	jobsoff.src = "./images/menu/jobs.gif";
	jobsred.src = "./images/menu/jobsred.gif";
	designoff.src = "./images/menu/design.gif";
	designred.src = "./images/menu/designred.gif";
	gamesoff.src = "./images/menu/games.gif";
	gamesred.src = "./images/menu/gamesred.gif";
	artoff.src = "./images/menu/art.gif";
	artred.src = "./images/menu/artred.gif";
	literatureoff.src = "./images/menu/literature.gif";
	literaturered.src = "./images/menu/literaturered.gif";
	sportsoff.src = "./images/menu/sports.gif";
	sportsred.src = "./images/menu/sportsred.gif";
	humoroff.src = "./images/menu/humor.gif";
	humorred.src = "./images/menu/humorred.gif";
	internoff.src = "./images/intern.gif";
	internred.src = "./images/internred.gif";
	emailmeoff.src = "./images/emailme.gif";
	emailmered.src = "./images/emailmered.gif";
	clickhereoff.src = "./images/clickhere.gif";
	clickherered.src = "./images/clickherered.gif";
	contactusoff.src = "./images/contactus.gif";
	contactusred.src = "./images/contactusred.gif";
	partneroff.src = "./images/partner.gif";
	partnerred.src = "./images/partnerred.gif";
	sitesoff.src = "./images/sites.gif";
	sitesmusic.src = "./images/sites/music.gif";
	sitesfashion.src = "./images/sites/fashion.gif";
	sitestravel.src = "./images/sites/travel.gif";
	sitesfilm.src = "./images/sites/film.gif";
	sitessex.src = "./images/sites/sex.gif";
	sitesjobs.src = "./images/sites/jobs.gif";
	sitesdesign.src = "./images/sites/design.gif";
	sitesgames.src = "./images/sites/games.gif";
	sitesart.src = "./images/sites/art.gif";
	sitesliterature.src = "./images/sites/lit.gif";
	sitessports.src = "./images/sites/sport.gif";
	siteshumor.src = "./images/sites/humor.gif";
	featuresoff.src = "./images/features.gif";
	featureswar.src = "./images/features/featureswar.gif";
	featuresriot.src = "./images/features/featuresriot.gif";
	communityoff.src = "./images/details.gif";
	communityintern.src = "./images/commun/communityintern.gif";
	communitywhat.src = "./images/commun/communitywhat.gif";
	communitycontactus.src = "./images/commun/contactus.gif";
	whatoff.src = "./images/whatis.gif";
	whatred.src = "./images/whatisred.gif";
	flag = true;
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

