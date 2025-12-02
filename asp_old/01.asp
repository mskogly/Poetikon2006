<!-- Story.asp -->
                  <%
                  IF NOT Request.Form("NextLine")="" THEN
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\01.txt", 8, TRUE)
                  MyTextFile.WriteLine(Request.Form("NextLine"))
                  MyTextFile.Close
                  END IF
                  %>

<HTML>
<HEAD>

<link rel=stylesheet href="../poetikon.css" type="text/css">
<TITLE>Poetikon : Noveller : Rustvegg, en historie som ikke skriver seg selv ...</TITLE>
</HEAD>

<BODY BGCOLOR="#91a1af" text="#FFFFFF" link="#000000" vlink="#000000" alink="#000000">

<CENTER>

<TABLE border="0" cellpadding="0" cellspacing="0" width="590">
<TR>
<td valign="top"><IMG SRC="img/croq99_08.gif" ALT="Illustrasjon : Rune Spaans" WIDTH="183" HEIGHT="280" BORDER="0" HSPACE="5">
<div align="center">

<BR><BR>[<A HREF="../noveller.html" target="_top">: historier</A>]</div></FONT>
</td>

<TD width="320">
<BR>

<div align="justify">
<B>Jeg skriver deg inn i et rom</B><p>


<%
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\01.txt")
                  WHILE NOT MyTextFile.AtEndOfStream
                    Response.Write(" "&MyTextFile.ReadLine)
                  WEND
                  MyTextFile.Close
                  %>
<BR><BR><DIV align="center">| <SMALL><A HREF="../noveller.html" target="_top">poetikon : historier</A></SMALL> |</DIV></FONT>


<br><DIV align="center"><!hr align="center" clear="all" size=1 noshade></DIV>

                  <FORM METHOD="POST" ACTION="01.asp">
                  <INPUT NAME="NextLine" TYPE="TEXT" lines=4 SIZE=45 maxlength="200">
                  <div align="right">(legg til en setning) &nbsp; &nbsp; &nbsp; &nbsp; <SMALL><INPUT TYPE="SUBMIT" VALUE="send setning"></SMALL></div>
                  </FORM><p>
Obs! Novellen vil bli redigert etter hvert, og ting som ikke passer inn vil bli tatt vekk, men tatt vare på. Kanskje vil de refuserte bitene bli brukt
til å starte nye historier?
</div>

<FONT FACE="Courier">
<div align="center"><small><!Refuserte setninger: :)-><br></div>
<div align="justify"><!Men alt var ikke bare fryd og gammen. Pølsa smakte reker. Digg.
Men alt var ikke bare fryd og gammen. Pølsa smakte reker. Digg.
så mye rart du kunne si
Livet er ikke spoersmaal om liv eller doed, men rett og slett poelse i broed.
Jeg brekker meg.
Du nyser.
Litt doed.
jeg ser deg halveis
reduksjonisme. Jeg reduserer meg til en skygge.
kutt. kutt. kutt. av med fettet.
Plutselig så banket det på døren,jeg skvatt til.for jeg ventet ikke noe besøk.Jeg listet meg fram
til døren
og svarte med min bestemte stemme..hvem er du?
Det er jo bare meg..hun tenkte for seg selv bare meg,jeg kjenner jo ikke dette mennesket
Katten min. Katten min katten min katten min.

Hodet blir plutselig glasur. Glatt, skjør og vakkert.
Kroppen vil bevege seg.
Jeg snur meg sakte og ser på kvinnen som ligget bundet på sengen. - Hva er det du har? Er du sjuk?
Hun ser på meg. Hånlig.

Nå er tiden her.
Tiden som har hjemsøkt meg lenge. Tiden som jeg trodde aldri skulle komme, men som nå har senket sitt mørke over sinnet mitt.
Mørket som tar fullstendig overhånd og utstøter hjernen fra kroppen. Jeg er sulten.
Jeg minnes joggeturene med Nina. De det aldri ble noe av.

Det er en mørk klode, og jeg hater joggebukser !
for joggeklærne får meg til å føle meg overdrevent sprek noe  jeg ikke er
selv om jeg vil være sprek, så er jeg ikke det. jeg må innse det. jeg kommer aldri til å bli noen

FAEN FOR NOE DRITT
..roper jeg til den flyvende giraffen som nettop har svømt inn gjennom vinduet. Alltid skjer det meg
Giraffen tar meg varsomt med til sitt rike.

Jeg finner kjæresten min istedet. Hun har lagt seg med en annen fyr. Det får så være.
Jeg har bedre ting å tenke på. Å skaffe meg en ny kjæreste, for eksempel. Eller kjøpe melk.
Melk er bra. Brus er bedre. Kjærlighet er best. Faen.
Der var det ordet igjen. Nuvel. Fyren i senga suger på puppene til jenta mi.
"Det har jeg også lyst til," tenker jeg, går ut av rommet og tar trikken.
På trikken elsker vi. Jeg og jenta på setet ved siden av meg.
Selv om vi aldri har møtt hverandre, tror jeg hun liker meg. Jeg smiler, og ser at klokka er
alt for mye, småhinker hjem og går og legger meg. Litt ubekvemt å ligge i samme seng som et par som
 elsker, men det går nok bedre etter hvert. Nå sover jeg.
 elsker, men det går nok bedre etter hvert. Nå sover jeg.
I søvnen finner jeg fred fra ubehagelige følelser.

->

</FONT>
</div>
</TD>







</TR></TABLE>

</CENTER>



</BODY>

</HTML>





