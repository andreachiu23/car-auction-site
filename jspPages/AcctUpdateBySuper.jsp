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
String uname = request.getParameter("uname");
String type = "";
HttpSession sesh = request.getSession();
String seshType = (String)sesh.getAttribute("type");
String seshName = (String)sesh.getAttribute("username");

if(field==null||uname.equals("")||(!(field.equals("Delete"))&& val.equals("")))
{
	response.sendRedirect("SuperupdateErr.jsp");
	return;
}

ApplicationDB db = new ApplicationDB();
Connection conn = db.getConnection();
Statement stm = conn.createStatement();	
String query;
ResultSet result;
//get account type
query = "SELECT Username FROM End_User_Account WHERE End_User_Account.Username = '"+uname+"'";
		result = stm.executeQuery(query);
		if(result.next()!= false)
		{
			type = "end";
		}
		
		query = "SELECT Username FROM Customer_Rep_Account WHERE Customer_Rep_Account.Username = '"+uname+"'";
		result = stm.executeQuery(query);
		if(result.next()!= false)
		{
			type = "rep";
		}
		
		query = "SELECT Username FROM Admin_Account WHERE Admin_Account.Username = '"+uname+"'";
		result = stm.executeQuery(query);
		if(result.next()!= false)
		{
			type  = "adm";
		}
//end get account type
if(seshName.equals(uname))
{
	response.sendRedirect("CantUpdate2.jsp");
	db.closeConnection(conn);
	return;	
}
if(type.equals("")||seshType.equals(type)||(seshType.equals("rep")&&type.equals("adm")))
{
	response.sendRedirect("CantUpdate.jsp");
	db.closeConnection(conn);
	return;
}
if(field.equals("Delete"))
{
	if(type.equals("adm"))
	{
		response.sendRedirect("CantDelete.jsp");
		db.closeConnection(conn);
		return;
	}
	
	//change username of any bids userHas placed to be deleted-user
	String qr = "update Bid set Username = '-deletedAccount-' where Username = '"+uname+"'";
	stm.executeUpdate(qr);
	
	//change username of any emails to user
	qr = "update email set toUsername = '-deletedAccount-' where toUsername = '"+uname+"'";
	stm.executeUpdate(qr);
	
	qr = "Update Auction set Seller_username = '-deletedAccount-' WHERE Auction.Seller_username = '"+uname+"';";
	stm.executeUpdate(qr);
	
	qr = "DELETE FROM Account WHERE Username = '"+uname+"';";
	stm.executeUpdate(qr);
	
	db.closeConnection(conn);
	response.sendRedirect("SuperDelete.jsp");
	return;
}

String qr = "UPDATE Account SET "+field+" = '"+val+"' WHERE Username = '"+uname+"';";
stm.executeUpdate(qr);
db.closeConnection(conn);
response.sendRedirect("updateSucc.jsp");
%>
</body>
</html>