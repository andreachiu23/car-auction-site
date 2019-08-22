<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit account information</title>
</head>
<body>
<body bgcolor="#E6E6FA">
	<form method="post" action="AcctUpdateBySuper.jsp">
 			<select name="itemToChange">
 				<option selected disabled>-Select Item to Change-</option>
 				<option value="Name">Name</option>
 				<option value="Email">Email Address</option>
 				<option value="Password">Password</option>	
 				<option value="Delete">Delete Account</option>				
 			</select>
		<table>
 			<tr>
 				<td>User Name of account:</td>
 				<td><input type="text" name="uname"></td>	
			</tr>
			 <tr>
 				<td>New Value:</td>
 				<td><input type="text" name="New-Value"></td>	
			</tr>
			<tr>
				<td><input value="Go" type="submit"></td>
			</tr>
		</table>	
	</form>
	<form method="post" action="AcctHome.jsp">
		<table>
			<tr>
				<td><input type="submit" value="Back"></td>
			</tr>
		</table>
	</form>
</body>
</html>