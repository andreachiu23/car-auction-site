<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title> Send Alert Email</title>

</head>



<body>
<body bgcolor="#E6E6FA">
<%
	ApplicationDB db = new ApplicationDB();
	Connection conn = db.getConnection();
	Statement stm = conn.createStatement();	

	HttpSession sesh = request.getSession();

		Date date = new Date();
	java.sql.Date cd = new java.sql.Date(date.getTime());
	java.sql.Timestamp ct = new java.sql.Timestamp(cd.getTime());

	String msgsub = "Listing Alert";
	String alertMan = "ALERT";
	String bod = "Your Alert # " + sesh.getAttribute("alertid") + " has been triggered!";
 

	String query = "";

	query = "INSERT INTO email(toUsername,fromUsername,msgsubject,msgBody,msgTime) VALUES ('"+sesh.getAttribute("owner")+"','"+alertMan+"','"+msgsub+"','"+bod+"','"+ct+"')";

	stm.executeUpdate(query);

	db.closeConnection(conn);


response.sendRedirect("auctionDetails.jsp");
%>
</body>
</html>
