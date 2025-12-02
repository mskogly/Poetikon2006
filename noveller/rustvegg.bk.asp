<!-- Story.asp -->
                  <%
                  IF NOT Request.Form("NextLine")="" THEN
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:Inetpub/wwwroot/poetikon/asp/novelle01.txt", 8, TRUE)
                  MyTextFile.WriteLine(Request.Form("NextLine"))
                  MyTextFile.Close
                  END IF
                  %>
<HTML>
<HEAD>
<link rel=stylesheet href="../poetikon.css" type="text/css">
<TITLE>Poetikon : Noveller : Rustvegg, en historie som ikke skriver seg selv ...</TITLE>
</HEAD>

<BODY BGCOLOR="#000000" background="../_img/arkiv/beigebg.gif" text="#FFFFFF" link="#FFFFFF" vlink="#DDDDDD" alink="#FFFFFF">

<CENTER>

<TABLE border="0" cellpadding="0" cellspacing="0" width="390"><TR>

<TD colspan="2" width="390">
<FONT FACE="Courier">
<IMG LOWSRC="../_img/lowsrc.gif" SRC="img/rustvegg.jpg" ALT="ustvegg, en historie som ikke skriver seg selv ..." WIDTH="400" HEIGHT="171" BORDER="0" HSPACE="5">
</td></tr>

<TR><TD colspan="2" width="390">
<BR><FONT FACE="Courier">

<B>Rustvegg.</B><div align="right"><SMALL>Skrevet av deg!<br>Illustrert av <A HREF="http://home.sol.no/~mskogly/" target="_new">Morten Skogly</A></SMALL></div>
<BR>
<div align="justify">

<%
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:Inetpub/wwwroot/poetikon/asp/novelle01.txt")
                  WHILE NOT MyTextFile.AtEndOfStream
                    Response.Write("&nbsp;&nbsp;"&MyTextFile.ReadLine)
                  WEND
                  MyTextFile.Close
                  %>


<br><br><br><br><DIV align="center"><hr align="center" clear="all" size=1 noshade></DIV>
                  <small>Legg ti<sup>l</sup> en s<sup>e</sup>tning:</small>
                  <FORM METHOD="POST" ACTION="rustvegg.asp">
                  <INPUT NAME="NextLine" TYPE="TEXT" lines=4 SIZE=50 maxlength="100">
                  <INPUT TYPE="SUBMIT" VALUE="Send setning.">
                  </FORM>

</div>

<BR><BR><DIV align="center">| <SMALL><A HREF="../noveller.html">poetikon : noveller</A></SMALL> |</DIV></FONT>
</TD>







</TR></TABLE>

</CENTER>



</BODY>

</HTML>





