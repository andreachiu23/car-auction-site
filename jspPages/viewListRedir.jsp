<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat, java.util.Date"%>
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
HttpSession sesh = request.getSession();

ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();

Statement stm = con.createStatement();

String tipe = (String)sesh.getAttribute("type");
String username = (String)sesh.getAttribute("username");
String post = sesh.getAttribute("postID").toString();
int postID = Integer.parseInt(post);
String seller = "";

String query1 = "SELECT * FROM Auction WHERE Post_ID = '"+postID+"'";

ResultSet res = stm.executeQuery(query1);
if(res.next()!= false)
{
	seller = res.getString("Seller_username");
}

if(tipe.equals("user"))
{
	//check here if user is owner of post
	if(seller.equals(username))
	{
		response.sendRedirect("displayListingOwner.jsp");
		return;
	}
	else{
		response.sendRedirect("displayListingUser.jsp");
	}
}
else{
	response.sendRedirect("displayListingSuper.jsp");
}


%>
</body>
</html>