<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Info</title>
</head>
<body>
<body bgcolor="#E6E6FA">
<%
out.println("Account Information:");
%>
<br>
<%
HttpSession sesh = request.getSession();
out.println("Name: "+sesh.getAttribute("Name"));
%>
<br>
<%
HttpSession sesh1 = request.getSession();
out.println("Username: "+sesh1.getAttribute("username"));
%>
<br>
<%
HttpSession sesh2 = request.getSession();
out.println("Account type: "+sesh2.getAttribute("type"));
%>
<br>
<%
HttpSession sesh3 = request.getSession();
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement stm = con.createStatement();
String email = "";
String query = "SELECT Email FROM Account WHERE Account.Username = '"+sesh3.getAttribute("username")+"'";

ResultSet result = stm.executeQuery(query);
if(result.next()!= false)
{
	email = result.getString("Email");
} 
out.println("Email: "+email);
%>

	<form method="post" action="AcctHome.jsp">
		<table>
			<tr>
				<td><input type="submit" value="Back"></td>
			</tr>
		</table>
	</form>
</body>
</html>