<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create an alert</title>



</head>
<body>
<body bgcolor="#E6E6FA">
Enter your vehicle details
(Fields with '*' are required)
	<div>
 		<form method="post" action="alertProcess.jsp">
 			
			Insert vehicle specifications
			<table>
			<tr>
				<td>*Year</td>
				<td><input type="text" name="year"></td>
			</tr>
			<tr>
				<td>*Make</td>
				<td><input type="text" name="make"></td>
			</tr>
			<tr>
				<td>*Model</td>
				<td><input type="text" name="model"></td>
			</tr>
  			<tr>
				<td><input value="Next" type="submit"/></td>
			</tr>
			</table>
 		</form>
 		
 		<form method="post" action="alertHub.jsp">
				<input value="Cancel" type="submit">
		</form>
			
 	</div>
</body>
</html>