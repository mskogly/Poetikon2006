                  <%
                  IF NOT Request.Form("NextLine")="" THEN
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\doede.txt", 8, TRUE)
                  MyTextFile.WriteLine(Request.Form("NextLine"))
                  MyTextFile.Close
                  END IF
                  %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>

<HEAD>
<META NAME="HandheldFriendly" content="True">
<TITLE>Poetikon.org</TITLE>
</HEAD>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF">
<A HREF="../index.html"><IMG SRC="../logo.gif" ALT="Poetikon" BORDER=0 width="150" height="32"></A>
<p>

<b>En liste over folk du har kjent som er døde nå</b>

<ol>
<%
                  Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
                  Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\doede.txt")
                  WHILE NOT MyTextFile.AtEndOfStream
                    Response.Write("&nbsp; <li>"&MyTextFile.ReadLine)
                  WEND
                  MyTextFile.Close
                  %>
</ol>


<p>
Gå til http://poetikon.org for å skrive inn i listene - <p>
<IMG SRC="../bunn.gif" ALT="pynt" BORDER=0 width="150" height="16"><br>

| <A HREF="../index.html">poetikon</A>

</BODY>

</HTML>