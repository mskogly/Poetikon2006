// Set to number of pages available.

var number=11;

// Becomes generated random  number.

var random_number=0;



// Create and define arrays.

link = new Array(11);

link[0] = "http://www.katode.org/poetikon/plirk/real/xylofon.ram";
link[1] = "http://www.katode.org/poetikon/plirk/real/alle.ram";
link[2] = "http://www.katode.org/poetikon/anders/alle.ram";
link[3] = "http://www.katode.org/poetikon/glitterputty/glitterputty2.ram";
link[4] = "http://www.katode.org/poetikon/thisoneisfortheneighbours/alle.ram";
link[5] = "http://www.katode.org/poetikon/real/jukebox.ram";
link[6] = "http://www.katode.org/poetikon/real/italienskopera2backwd.ram";
link[7] = "http://www.katode.org/poetikon/plirk/real/xylofon.ram";
link[8] = "http://www.katode.org/poetikon/real/5videoerutenlyd.ram";
link[9] = "http://www.katode.org/poetikon/real/tristessa.ram";
link[10] = "http://www.katode.org/poetikon/real/einarstenseng_gitar.ram";
link[11] = "http://www.katode.org/poetikon/real/spore_seashellbuzzmix.ram";


// Called by Load Random Page link - loads random page to current window.

function loadRandomPage()

   {

   // Random number generating.

     today=new Date();
     jran=today.getTime();
     ia=9301;
     ic=49297;
     im=233280;
     jran = (jran*ia+ic) % im;
     random_number=Math.ceil( (jran/(im*1.0)) *number);

   // Load random page.

     window.location=link[random_number-1];

   }
