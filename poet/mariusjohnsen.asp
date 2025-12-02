<!-- Story.asp -->
                  <%
                  IF NOT Request.Form("NextLine")="" THEN
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\dikt\mist.txt", 8, TRUE)
                  MyTextFile.WriteLine(Request.Form("NextLine"))
                  MyTextFile.Close
                  END IF
                  %>

<HTML>
<HEAD>
<TITLE>Poetikon : Dikt av Mist</TITLE>
<link rel="stylesheet" href="./poet.css" type="text/css">

</HEAD>
<BODY>


<div class=tekst>

<%
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\dikt\mist.txt")
                  WHILE NOT MyTextFile.AtEndOfStream
                    Response.Write("<br>"&MyTextFile.ReadLine)
                  WEND
                  MyTextFile.Close
                  %>

<div align=right>- Mist<br><A HREF="mailto:MARJOH@statoil.com">MARJOH@statoil.com</A></div>

</div>
</BODY>
</HTML>
