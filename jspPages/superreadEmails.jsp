<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 	<head>
 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 		
 		<title> Emails</title>
 	</head>
 	
 
 	
 	<h1>Emails</h1>
 	
 
 	
 <body>
 <body bgcolor="#E6E6FA">
 
 <form action = "superEmailHub.jsp">
 		
 		
 		<input type = "submit" value = "Return"/>
 		
 		</form>
 		
 		<br>
 			
<%
	//Display Email Table
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			HttpSession sesh = request.getSession();
			
			String str = "SELECT fromUsername,msgsubject,msgBody,msgTime FROM email WHERE toUsername = '"+sesh.getAttribute("username")+"' order by msgTime desc";
			
			ResultSet result = stmt.executeQuery(str);
			String output = "";
			String header = "<tr><td><b>From<b></td><td><b>Subject<b></td><td><b>Message</b></td><td><b>Time Received</b></td></tr>";
			
	while(result.next()!= false)
	{
		output = output+"<tr><td>"+result.getString("fromUsername")+"</td><td>"+result.getString("msgsubject")+"</td><td>"+result.getString("msgBody")+"</td><td>"+result.getTimestamp("msgTime")+"</td></tr>";
	}
	
%>
 		
<table border=1 style ="display: grid; border: 2px solid; float Left;padding: 5px;grid-template-columns: auto auto;width: 50%;">
	<%=header %>
	<%=output %>
 </table>


 		
 		
 		
 	
 
 </body>
 
 
 
 </html>