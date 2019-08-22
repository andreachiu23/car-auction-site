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
String tipe = (String)sesh.getAttribute("type");
if(tipe.equals("user"))
{
		response.sendRedirect("bidHistoryUserView.jsp");
}
else
{
	response.sendRedirect("bidHistorySuperView.jsp");
}
%>
</body>
</html>