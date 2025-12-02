                  <%
                  IF NOT Request.Form("NextLine")="" THEN
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\honning\n_panteren.txt", 8, TRUE)
                  MyTextFile.WriteLine(Request.Form("NextLine"))
                  MyTextFile.Close
                  END IF
                  %>

<HEAD>
<TITLE>poetikon | honningdikt</TITLE>

<META NAME="Generator" CONTENT="HTMLed32 Version 2.0d">

<META NAME="Author" CONTENT="Poetikon">
<link rel=stylesheet href="../grey.css" type="text/css">

</HEAD>


<BODY marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">
<span class=ill><IMG lowsrc="../img/beige.gif" SRC="../bilder/rumpe.jpg" ALT="Rumpe" WIDTH="400" HEIGHT="155" BORDER="0" VSPACE="0" HSPACE="0"></span>
<div class="tittel"><A HREF="index.html">p o e s i &nbsp; <img src="../img/graa.gif" width="4" height="4" border="1"></A> &nbsp;</div>
<div class=tekst2>

<%
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\honning\n_panteren.txt")
                  WHILE NOT MyTextFile.AtEndOfStream
                    Response.Write("<br>"&MyTextFile.ReadLine)
                  WEND
                  MyTextFile.Close
                  %>

<BR>
Har du noen erotisk tekster som kan passe inn her? Send det inn, uten å betenke deg noe større om! Adressen er <a href="mailto:poetikon@hotmail.com">poetikon@hotmail.com</a>.
</div>



</BODY>

</HTML>



