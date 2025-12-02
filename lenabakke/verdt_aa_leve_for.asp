                  <%
                  IF NOT Request.Form("NextLine")="" THEN
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\verdt_aa_leve_for.txt", 8, TRUE)
                  MyTextFile.WriteLine(Request.Form("NextLine"))
                  MyTextFile.Close
                  END IF
                  %>

<HTML>

<HEAD>
<link rel=stylesheet href="./lister.css" type="text/css">
<TITLE>Poetikon  : Lister : Ting som er verdt å leve for</TITLE>
</HEAD>

<BODY BGCOLOR="#91a1af"  text="#FFFFFF" link="#FFFFFF" vlink="#DDDDDD" alink="#FFFFFF">
<CENTER>
<TABLE border="0" cellpadding="10" cellspacing="2">
<TD width="400">
<DIV align="center">| <SMALL><!A HREF="../noveller2.html">noe verdt å leve for<!/A></SMALL> |</DIV></FONT>
</td></tr>


<TR>

<TD width="400" bgcolor="#9AA9B6" EBEBEB>
<ol>
<%
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\verdt_aa_leve_for.txt")
                  WHILE NOT MyTextFile.AtEndOfStream
                    Response.Write("&nbsp;<li>"&MyTextFile.ReadLine)
                  WEND
                  MyTextFile.Close
                  %>
</ol>
<A NAME="Og"><A NAME="Og">
 <FORM METHOD="POST" ACTION="verdt_aa_leve_for.asp#Og">
<div align="center"><SMALL>Legg til et punkt på lista!</SMALL><BR>
<SMALL><textarea NAME="NextLine" wrap="VIRTUAL" rows="4" cols="46"></textarea>
<BR>
<BR><INPUT TYPE="SUBMIT" VALUE="send"><BR>(denne listen er startet av <A HREF="mailto:louis01@online.no">torkel</A>)</SMALL>
</div></FORM>

</td>


</TR></TABLE>






</CENTER>



</BODY>

</HTML>





