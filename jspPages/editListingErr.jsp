<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat, java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit the Listing</title>


	
</head>

<body bgcolor="#E6E6FA">
<div>
<form method="post" action="editListingVerify.jsp">
<table>
<tr>
		<td>
			<select name="Category" onchange="checkvalue(this.options[this.selectedIndex].value)">
 				<option selected disabled>-Select Field to Edit-</option>
 				<option value="Class">Class</option>
 				<option value="Color">Color</option>
 				<option value="VIN">VIN</option>
 				<option value="Make">Make</option>
 				<option value="Model">Model</option>
 				<option value="Year">Year</option>
 				<option value="Trans">Transmission</option>
 				<option value="Drive">Drive</option>
 				<option value="Mileage">Mileage</option>
 				<option value="Cond">Condition</option>
 				<option value="Location">Location</option>
 				<option value="Title">Title Status</option>
 				<option value="Reserve">Reserve</option>
 				<option value="MinBid">Minimum Bid Interval</option>
 			</select>
		</td>
	</tr>
	<tr>
		<td>New Value:</td>	
		<td><input type="text" name="New"></td>
		</tr>
	<tr>
		<td><input value="Submit" type="submit"></td>
	</tr>
	</table>
</form>
</div>
*Invalid value entered for selected field*


<form method="post" action="editListingVerify.jsp">
	<input value="Submit" type="submit">
</form>

</body>
</html>