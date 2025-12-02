                  <%
                  IF NOT Request.Form("NextLine")="" THEN
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\marinymoen_paadenandresidenavdeg.txt", 8, TRUE)
                  MyTextFile.WriteLine(Request.Form("NextLine"))
                  MyTextFile.Close
                  END IF
                  %>

<HTML>

<HEAD>
<link rel=stylesheet href="./noveller.css" type="text/css">
<TITLE>Poetikon  : Noveller : På den andre siden av deg, av Mari Nymoen.</TITLE>
</HEAD>

<BODY BGCOLOR="#91a1af"  text="#FFFFFF" link="#FFFFFF" vlink="#DDDDDD" alink="#FFFFFF">
<CENTER>
<TABLE border="0" cellpadding="10" cellspacing="2">
<TR>

<TD width="400">

<B>På den andre siden av deg.</B><div align="right"><SMALL>Skrevet av <a href="mailto:mnymoe@online.no">Mari Nymoen</a></SMALL></div>

<div  class="tekst">


Man kan gå langsomt gjennom en gate i en by man hater og frykter, men likevel bruke beina som en som har livet i denne byens sekk og skal elske og leve her. Den som går bak leser ikke tankene, men vet om noe som har 59 meter igjen, nærværet.
Nærværet kan ha vart i 5 år, kanskje seks, men minnene er eldre. Minner er alltid eldst.<BR>
Om 6 minutter har han som har jordens ganglag og profilene de gamle romerne søkte å forme sagt farvel. Sekken er slengt over høyre skulder og det høyre beinet vil ta det første skrittet opp gaten hvor hun senere skulle legge skrittene som var klistret inn i døgnets album, en utgave hun ville skrike seg gjennom.<p>
Men tyngde+skritt+jord skaper gange, som kan summeres opp ved at han stanser ved krysset ved byens eldste lykt, lener tyngden mot venstre og trekker pusten. Lansebæreren plassert i kopier i alle Italias museer ville smuldret, og elevene ikke lenger hatt noen tyngde å tolke eller jobbe mot. Lite visste de alle om den perfekte tyngde-plassering hos menneske enn hun som hadde holdt seg centimeterne bak mens meterne telte ned.
<p>
Jeg lister meg rundt nedslitte høst-hjørner og vinden er ukjent for hvert eneste dype pust. Jeg kunne vunnet alt annet enn denne krigen på en dag, og i havet slår en hammer som pisker den vakre høsten inn i hjertene våre. Rosene, fiendene, jakka di fant jeg aldri igjen.<BR>
Ikke snu deg, jeg er alltid rett bak, og til slutt skal jeg snu meg for siste gang, og gjennom ild og vann hvor alle dør ser jeg en umiskjennelig profil og hvisker om kongen husker meg. Jeg kan allerede se det, og forteller deg i natt at det er aldri noen hyller å legge dette på. Jeg venter, om så på andre siden av deg.


</div>
<p>
<div align="right">
<B>- Mari Nymoen<br><a href="mailto:mnymoe@online.no">mnymoe@online.no</a></B></div>


<BR><BR><DIV align="center">| <SMALL><A HREF="../noveller2.html">poetikon : noveller</A></SMALL> |</DIV></FONT>
</td></tr>


<TR>

<TD width="400" bgcolor="#9AA9B6" EBEBEB><div class="tekst">

<%
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\marinymoen_paadenandresidenavdeg.txt")
                  WHILE NOT MyTextFile.AtEndOfStream
                    Response.Write("<p>"&MyTextFile.ReadLine)
                  WEND
                  MyTextFile.Close
                  %>

<A NAME="Og"><A NAME="Og">
 <FORM METHOD="POST" ACTION="marinymoen_paadenandresidenavdeg.asp#Og">
<SMALL>Si din mening, lim inn ett dikt eller fortsett historien:</SMALL><p>
<SMALL><textarea NAME="NextLine" wrap="VIRTUAL" rows="4" cols="45"></textarea>
<BR><BR><BR>
<BR><INPUT TYPE="SUBMIT" VALUE="send"></SMALL><BR><BR>
</FORM></td>

</TR>
</TR></TABLE>






</CENTER>



</BODY>

</HTML>





