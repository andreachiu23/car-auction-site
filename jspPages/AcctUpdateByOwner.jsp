<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body bgcolor="#E6E6FA">
<%
String field= request.getParameter("itemToChange");
String val = request.getParameter("New-Value");
HttpSession sesh = request.getSession();
if(field == null)
{
	response.sendRedirect("updateErr.jsp");
	return;
}

if(!(field.equals("Delete"))&& val.equals(""))
{
	response.sendRedirect("updateErr.jsp");
	return;
}

ApplicationDB db = new ApplicationDB();
Connection conn = db.getConnection();

Statement stm = conn.createStatement();	

if(field.equals("Delete"))
{
	String tipe = (String)sesh.getAttribute("type");
	if(tipe.equals("admin"))
	{
		response.sendRedirect("CantDelete.jsp");
		db.closeConnection(conn);
		return;
	}
	//change username of any bids userHas placed to be deleted-user
	String qr = "update Bid set Username = '-deletedAccount-' where Username = '"+sesh.getAttribute("username")+"'";
	stm.executeUpdate(qr);
	
	//change username of any emails to user
	qr = "update email set toUsername = '-deletedAccount-' where toUsername = '"+sesh.getAttribute("username")+"'";
	stm.executeUpdate(qr);
	
	//edit owner of auctions the user posted 
	qr = "Update Auction set Seller_username = '-deletedAccount-' WHERE Auction.Seller_username = '"+sesh.getAttribute("username")+"';";
	stm.executeUpdate(qr);
	
	qr = "DELETE FROM Account WHERE Username = '"+sesh.getAttribute("username")+"';";
	stm.executeUpdate(qr);
	
	db.closeConnection(conn);
	response.sendRedirect("Delete.jsp");
	return;
}

String qr = "UPDATE Account SET "+field+" = '"+val+"' WHERE Username = '"+sesh.getAttribute("username")+"';";

stm.executeUpdate(qr);

db.closeConnection(conn);

if(field.equals("Name"))
{
	sesh.setAttribute("name",val);
}

if(field.equals("Email"))
{
	sesh.setAttribute("email",val);
}

response.sendRedirect("updateSucc.jsp");
%>
</body>
</html>