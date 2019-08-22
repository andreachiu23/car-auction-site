<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat, java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validating Information...</title>

</head>
<body bgcolor="#E6E6FA">
<%

HttpSession sesh = request.getSession();


//Retrieve all parameters
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();


String post = sesh.getAttribute("postID").toString();

int postID = Integer.parseInt(post);



		
Statement stm = con.createStatement();

String query1 = "Select * FROM Bid WHERE Post_ID = '"+postID+"' ORDER BY Time";
String output = "";
String user = "";
double amount = 0;
Date d = new Date();
java.sql.Timestamp time = new java.sql.Timestamp(d.getTime());
String t = "";

ResultSet res = stm.executeQuery(query1);
while(res.next()!= false)
{
	user = res.getString("Username");
	amount = res.getDouble("Amount");
	time = res.getTimestamp("Time");
	t = time.toString();
	output = output +"<tr><td>" + user + "</td><td>" + amount + "</td><td>" + t + "</td></tr>";
}
String huser = "User";
String hamount = "Amount";
String htime = "Time";
String header = "<th>" + huser + "<th>" + hamount + "<th>" + htime;

db.closeConnection(con);
%>
<table border=1>
<%=header%>
<%=output%>
</table>
<form method="post" action="viewListRedir.jsp"> 
	<input value="Back" type="submit">
</form>

</body>
</html>