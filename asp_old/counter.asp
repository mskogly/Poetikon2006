<%
Dim Connection, RS, Page, Counts
Page=Request.ServerVariables("SCRIPT_NAME")
Set Connection=Server.Createobject("ADODB.Connection")
Connection.Open "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("counter.mdb")
If Len(Session(Page)) = 0 Then
	Set RS = Connection.Execute("SELECT * FROM counter WHERE fldPage = '" & Page & "'")
	If RS.EOF = TRUE Then
		Connection.Execute("INSERT INTO counter (fldPage, fldCount) VALUES ('"&Page&"', 0)")
	End If
	Set RS = Connection.Execute("SELECT * FROM counter WHERE fldPage = '" & Page & "'")
	Counts=RS("fldCount")+1
	Set RS =  Connection.Execute("UPDATE counter SET fldCount = " & Counts & " WHERE fldPage = '" & Page & "'")
	Session(Page) = "something"
	Connection.Close
Else
	Set RS = Connection.Execute("SELECT * FROM counter WHERE fldPage = '" & Page & "'")
	Counts=RS("fldCount")
End If
Response.Write Counts
%>