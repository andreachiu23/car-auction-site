<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="Refresh" content="2;url=superPostedQuestions.jsp">
	<title>answer Question</title>
</head>
<body>
<body bgcolor="#E6E6FA">

<% 
	String ans = request.getParameter("answerr");
	

	ApplicationDB db = new ApplicationDB();
	Connection conn = db.getConnection();
	Statement stm = conn.createStatement();
	
	HttpSession sesh = request.getSession();
	
	String user = sesh.getAttribute("username").toString();
	//int pID = Integer.parseInt(sesh.getAttribute("postID").toString());
	//int qID = Integer.parseInt(sesh.getAttribute("qid").toString());
	
	//out.print("User, Question_ID, Post_ID, Answer: " + user + qID + pID + ans);

	String query = "";
	
	query = "UPDATE Question SET answer = '"+ans+"', answerUser = '"+user+"' WHERE Post_ID = '"+Integer.parseInt(sesh.getAttribute("postID").toString())+"' AND Question_ID = '"+Integer.parseInt(sesh.getAttribute("qid").toString())+"'";
	
	stm.executeUpdate(query);

	db.closeConnection(conn);
/*
	HttpSession sesh = request.getSession();
	
	String query = "";
	
	query = "INSERT INTO Question(Question_ID,Username,answerUser,Post_ID, Body,answer) VALUES ("+maxVal+",'"+sesh.getAttribute("username")+"',null,"+id+",'"+message+"','"+ans+"')";

	stm.executeUpdate(query);
	*/
	
	
%>

</body>

</html>