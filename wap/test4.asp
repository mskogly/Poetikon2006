<%
Response.Buffer = True
Response.ContentType = "text/vnd.wap.wml"
%>


<?xml version="1.0"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">


<wml>


<template>
<do type="Tilbake"><prev/></do>
</template>

<card id="meny" title="poetikon">
<p align="left">

<b>
<b><a href="naermere.wml">N&#230;rmere</a></b><br/>
<small>En liten historie av Tony Syversen.</small><br/><br/>

<b><a href="setninger.wml">Fine setninger</a></b><br/>
<small>Liste.</small><br/><br/>

<b><a href="hjertesmerte/10.wml">Hjertesmerte</a></b><br/>
<small>12 vakre kj&#230;rlighetsdikt ...</small><br/><br/>

</b>

</p>

<%
Set MyFileObject=Server.CreateObject("Scripting.FileSystemObject")
Set MyTextFile=MyFileObject.OpenTextFile("d:\sites\www.katode.org\poetikon\asp\test.txt")
WHILE NOT MyTextFile.AtEndOfStream
  Response.Write("<br/>plipp<br/>"&MyTextFile.ReadLine)
WEND
MyTextFile.Close
%>



</card>




</wml>

