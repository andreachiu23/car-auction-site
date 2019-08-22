<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<h1>EBAE</h1>
<body>
<body bgcolor="#E6E6FA">
<table>
<tr>
 <td>Welcome To our Car Auction Site!</td>
</tr>
<tr>
 <td>To View Listings, Please Login. If You Don't Have An Account, Create One. </td>
</tr>
</table>
	<form method="post" action="VerifyLogin.jsp">
		<table>
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Login"></td>
			</tr>
		</table>
	</form>
	<form method="post" action="CreateAccountPage.jsp">
		<table>
			<tr>
				<td><input type="submit" value="Register"></td>
			</tr>
		</table>
	</form>
</body>
</html>