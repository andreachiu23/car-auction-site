<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title> Display alerts</title>

</head>

<h1>Your Alerts</h1>

<body>
<body bgcolor="#E6E6FA">
<%

	

	//Display Email Table

	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();		

	//Create a SQL statement
	Statement stmt = con.createStatement();
	HttpSession sesh = request.getSession();

	String str = "SELECT alertID,year,make,model FROM Item_Alert Where Owner = '"+sesh.getAttribute("username")+"'";

	ResultSet result = stmt.executeQuery(str);
	String output = "";
	String header = "<tr><td><b>Alert ID<b></td><td><b>Year<b></td><td><b>Make</b></td><td><b>Model</b></td></tr>";

	while(result.next()!= false)
	{
	output = output+"<tr><td>"+result.getInt("alertID")+"</td><td>"+result.getString("year")+"</td><td>"+result.getString("make")+"</td><td>"+result.getString("model")+"</td></tr>";
	
	}

%>

<form action = "superalertHub.jsp">
 		
		<br>
 		<input type = "submit" value = "Return"/>
 		
 		</form>
 		<br>

<table border=1 style ="display: grid; border: 2px solid; float Left;padding: 5px;grid-template-columns: auto auto;width: 50%;">
<%=header %>
<%=output %>
</table>


</body>

</html>