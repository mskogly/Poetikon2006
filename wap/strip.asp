<%
' An online version of this code can be found at:
' http://www.manastungare.com/asp/wapmail/demo.asp
' Copyright (c) 2000, Manas Tungare
' You can use this code in your own projects.

Response.Buffer = True
Response.ContentType = "text/vnd.wap.wml"
Response.Write "<?xml version=""1.0""?><!DOCTYPE wml PUBLIC ""-//WAPFORUM//DTD WML 1.1//EN"" ""http://www.wapforum.org/DTD/wml_1.1.xml"">"
%>


                  <%
                  IF NOT Request.Form("NextLine")="" THEN
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\testg.txt", 8, TRUE)
                  MyTextFile.WriteLine(Request.Form("NextLine"))
                  MyTextFile.Close
                  END IF
                  %>

<wml>
<card id="Hep" title="Poetikon">
<%
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\test.txt")
                  WHILE NOT MyTextFile.AtEndOfStream
                    Response.Write("<br/>hoho"&MyTextFile.ReadLine)
                  WEND
                  MyTextFile.Close
                  %>
</card>



