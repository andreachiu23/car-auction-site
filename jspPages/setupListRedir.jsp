<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession sesh = request.getSession();

String Id = request.getParameter("postID");

int postId = Integer.parseInt(Id);

sesh.setAttribute("postID", postId);

response.sendRedirect("viewListRedir.jsp");
%>
</body>
</html>