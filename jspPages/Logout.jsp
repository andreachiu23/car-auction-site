<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.concurrent.TimeUnit"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Refresh" content="5;url=loginPage.jsp">
<title>Logout Success</title>
</head>
<body>
<body bgcolor="#E6E6FA">
<% 
HttpSession sesh = request.getSession();
out.println("Logout Successful. Goodbye "+sesh.getAttribute("Name")+"...redirecting to login page");
sesh.invalidate();
%>
</body>
</html>