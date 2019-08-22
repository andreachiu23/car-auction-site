<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Rep-Homepage</title>
</head>
<body>
<body bgcolor="#E6E6FA">
<% 
HttpSession sesh = request.getSession();

ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();

Statement stm = con.createStatement();

String query = "SELECT Name FROM Account WHERE Account.Username = '"+sesh.getAttribute("username")+"'";

ResultSet result = stm.executeQuery(query);
if(result.next()!= false)
{
	String name = result.getString("Name");
	db.closeConnection(con);
	out.println("Welcome, "+name+"!");
	sesh.setAttribute("Name",name);
}
%>

<p>You have successfully logged in using username: <%=sesh.getAttribute("username")%></p>
	<form method="post" action="Logout.jsp">
		<table>
			<tr>
				<td><input type="submit" value="Logout"></td>
			</tr>
		</table>
	</form>
		<form method="post" action="a_search.jsp">
		<table>
			<tr>
				<td><input type="submit" value="Browse Listings"></td>
			</tr>
		</table>
	</form>
	<form method="post" action="vehicleDetails.jsp">
		<table>
			<tr>
				<td><input type="submit" value="Create Listing"></td>
			</tr>
		</table>
	</form>
	<form method="post" action="Inbox.jsp">
		<table>
			<tr>
				<td><input type="submit" value="Inbox/Alerts"></td>
			</tr>
		</table>
	</form>
	<form method="post" action="ViewAcct.jsp">
		<table>
			<tr>
				<td><input type="submit" value="View Account Info"></td>
			</tr>
		</table>
	</form>
		<form method="post" action="userAcctSettings.jsp">
		<table>
			<tr>
				<td><input type="submit" value="Edit Account"></td>
			</tr>
		</table>
	</form>
		<form method="post" action="superuserAcctSettings.jsp">
		<table>
			<tr>
				<td><input  id="adm2" type="submit" value="Edit a User Account"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>