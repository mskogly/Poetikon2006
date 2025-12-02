                  <%
                  IF NOT Request.Form("NextLine")="" THEN
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\blakk.txt", 8, TRUE)
                  MyTextFile.WriteLine(Request.Form("NextLine"))
                  MyTextFile.Close
                  END IF
                  %>

<HTML>

<HEAD>
<link rel=stylesheet href="./lister.css" type="text/css">
<TITLE>Poetikon  : Lister : Ting man kan gjøre når man er blakk</TITLE>
</HEAD>

<BODY BGCOLOR="#91a1af"  text="#FFFFFF" link="#FFFFFF" vlink="#DDDDDD" alink="#FFFFFF">
<CENTER>
<TABLE border="0" cellpadding="10" cellspacing="2">
<TD width="400">
<DIV align="left"><b>Ting man kan gjøre når man er blakk</b> |</DIV>
</td></tr>


<TR>

<TD width="400" class="ompa">
<ol>
<%
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\blakk.txt")
                  WHILE NOT MyTextFile.AtEndOfStream
                    Response.Write("&nbsp; <li>"&MyTextFile.ReadLine)
                  WEND
                  MyTextFile.Close
                  %>
</ol>
<A NAME="Og"><A NAME="Og">
 <FORM METHOD="POST" ACTION="blakk.asp#Og">
<div align="center"><SMALL>Legg til et punkt på lista.</SMALL><BR>
<SMALL><textarea NAME="NextLine" wrap="VIRTUAL" rows="4" cols="46"></textarea>

<BR><INPUT TYPE="SUBMIT" VALUE="send"></SMALL>
</div></FORM>

</td>
<td valign="top"><div align="right">

</div></td>
</TR></TABLE>






</CENTER>



</BODY>

</HTML>





