<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat, java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Set an Auto Bid</title>


	
</head>

<body bgcolor="#E6E6FA">
<div>
<form method="post" action="autoBidVerify.jsp">
<table>
	<tr>
		<td>Initial Bid:</td>
		<td><input type="text" name="initial"></td>
	</tr>
	
	<tr>
		<td>Increment Amount:</td>	
		<td><input type="text" name="inc"></td>
	</tr>
	<tr>
		<td>(How much higher the auto bid will be)</td>	
	</tr>
	<tr>
		<td>Limit:</td>	
		<td><input type="text" name="limit"></td>
	</tr>
	<tr>
		<td>(At what amount to cancel the auto bid)</td>	
	</tr>
	<tr>
		<td><input value="Submit" type="submit"></td>
	</tr>
	</table>
</form>
</div>


<form method="post" action="displayListingUser.jsp">
	<input value="Cancel" type="submit">
</form>

</body>
</html>