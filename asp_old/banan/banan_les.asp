<!-- Story.asp -->
                  <%
                  IF NOT Request.Form("NextLine")="" THEN
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\antologier\banan.txt", 8, TRUE)
                  MyTextFile.WriteLine(Request.Form("NextLine"))
                  MyTextFile.Close
                  END IF
                  %>

<HTML>
<HEAD>

<link rel=stylesheet href="../../poetikon.css" type="text/css">
<TITLE>Poetikon : Antologier : Mitt skip er lastet med ...</TITLE>
</HEAD>

<BODY BGCOLOR="#91a1af" text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<div align="right"><A HREF="./default.asp" TARGET="_top"> <IMG SRC="./_img/h_antologier.gif" ALT="poetikon" WIDTH="133" HEIGHT="17" BORDER="0"></A><IMG SRC="./_img/lowsrc.gif" WIDTH="31" HEIGHT="15" BORDER="0"><br><IMG SRC="./_img/lowsrc.gif" WIDTH="100" HEIGHT="2" BORDER="0"></div>

<CENTER>

<TABLE border="0" cellpadding="10" cellspacing="10" width="450">
<TR>
<td valign="top" align="right"><IMG SRC="banan.gif" ALT="" WIDTH="30" HEIGHT="30" BORDER="0" HSPACE="5"><P>
</P>
</td>

<TD width="390">
<BR><FONT FACE="Courier">

<center">[ <A HREF="banan_les.asp">LES</A> ] [ <A HREF="banan_legginn.asp">LEGG INN</A> ]</center><BR>
<div align="justify">
<B>Antologi: Mitt skip er lastet med .... </B><p>
Her kan du lese tekstene som er kommet inn til nå:




<%
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\antologier\banan.txt")
                  WHILE NOT MyTextFile.AtEndOfStream
                    Response.Write("<br>"&MyTextFile.ReadLine)
                  WEND
                  MyTextFile.Close
                  %>



               <p>*<p>
Obs! Antologien vil bli redigert litt etter hvert, og ting som ikke passer inn eller er useriøse vil bli tatt vekk. Hvis du har en tekst som ikke passer inn noe sted, kan du maile den til oss på <A HREF="mailto:poetikon@hotmail.om">poetikon@hotmail.om</A>



<BR><BR><DIV align="center">| <SMALL><A HREF="../../antologier.html" target="_self">poetikon : antologier</A></SMALL> |</DIV></FONT>


</div>

</TD>







</TR></TABLE>

</CENTER>



</BODY>

</HTML>





