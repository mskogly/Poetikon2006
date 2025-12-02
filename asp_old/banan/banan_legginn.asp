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
<div align="right"><A HREF="../../default.asp" TARGET="_top"> <IMG SRC="../../_img/h_antologier.gif" ALT="poetikon" WIDTH="133" HEIGHT="17" BORDER="0"></A><IMG SRC="../../_img/lowsrc.gif" WIDTH="31" HEIGHT="15" BORDER="0"><br><IMG SRC="../../_img/lowsrc.gif" WIDTH="100" HEIGHT="2" BORDER="0"></div>
<CENTER>

<TABLE border="0" cellpadding="0" cellspacing="0" width="400">
<TR>
<td valign="top"><IMG SRC="banan.gif" ALT="" WIDTH="30" HEIGHT="30" BORDER="0" HSPACE="5">

</td>

<TD width="390">
<BR><FONT FACE="Courier">

<div align="justify">
<B>Antologi: Mitt skip er lastet med .... </B><p>

<p>
Lim inn teksten din i skjemaet under. Husk å skrive inn ditt navn og mailadresse, slik at vi får tak i deg ...

<P ALIGN="center">[ <A HREF="banan_les.asp">LES</A> ] [ <A HREF="banan_legginn.asp">LEGG INN</A> ]</P>


<br><DIV align="center"><!hr align="center" clear="all" size=1 noshade></DIV>

                  <FORM METHOD="POST" ACTION="banan_les.asp">

<textarea NAME="NextLine" wrap="VIRTUAL" rows="200" cols="46"></textarea>

                  <div align="right">&nbsp; &nbsp; &nbsp; &nbsp; <SMALL><INPUT TYPE="SUBMIT" VALUE="legg inn tekst"></SMALL></div>
                  </FORM><p>




<%
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\antologier\banan.txt")
                  WHILE NOT MyTextFile.AtEndOfStream
                    Response.Write("<br>"&MyTextFile.ReadLine)
                  WEND
                  MyTextFile.Close
                  %>
<BR><BR><DIV align="center">| <SMALL><A HREF="../../antologier.html" target="_top">poetikon : antologier</A></SMALL> |</DIV></FONT>


</div>

</TD>







</TR></TABLE>

</CENTER>



</BODY>

</HTML>





