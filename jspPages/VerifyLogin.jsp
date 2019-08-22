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
String uname = request.getParameter("username");
String pass = request.getParameter("password");
String pw = "";
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();

Statement stm = con.createStatement();

String query = "SELECT Password FROM Account WHERE Account.Username = '"+uname+"'";

ResultSet result = stm.executeQuery(query);
if(result.next()!= false)
{
	pw = result.getString("Password");

	//String pw = select Password from Account where Username = uname
	//out.println(pw);
	if(pass.equals(pw)&& !(pw.equals("")))
 	{
		HttpSession sesh = request.getSession();
		
		sesh.setAttribute("username",uname);
		sesh.setAttribute("password",pass);
		
		query = "SELECT Username FROM End_User_Account WHERE End_User_Account.Username = '"+uname+"'";
		result = stm.executeQuery(query);
		if(result.next()!= false)
		{
			sesh.setAttribute("type","user");
			sesh.setAttribute("auto","");
			sesh.setAttribute("low","");
			db.closeConnection(con);	
	  		response.sendRedirect("UserLoginSuccess.jsp");
	  		return;
		}
		
		query = "SELECT Username FROM Customer_Rep_Account WHERE Customer_Rep_Account.Username = '"+uname+"'";
		result = stm.executeQuery(query);
		if(result.next()!= false)
		{
			sesh.setAttribute("type","rep");
			sesh.setAttribute("auto","");
			sesh.setAttribute("low","");
			db.closeConnection(con);	
			response.sendRedirect("RepLoginSuccess.jsp");
			return;
		}
		
		query = "SELECT Username FROM Admin_Account WHERE Admin_Account.Username = '"+uname+"'";
		result = stm.executeQuery(query);
		if(result.next()!= false)
		{
			sesh.setAttribute("type","admin");
			sesh.setAttribute("auto","");
			sesh.setAttribute("low","");
			db.closeConnection(con);	
			response.sendRedirect("AdminLoginSuccess.jsp");
			return;
		}
		db.closeConnection(con);	

 	}	
	else
	{
		db.closeConnection(con);
		response.sendRedirect("LoginErr.jsp");
	}
}
else
{
	db.closeConnection(con);
	response.sendRedirect("LoginErr.jsp");
}
%>
</body>
</html>