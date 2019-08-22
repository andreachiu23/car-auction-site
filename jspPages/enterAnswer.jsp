<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>answer Question</title>
</head>
<body>
<body bgcolor="#E6E6FA">

<% 
	String pID = request.getParameter("postIDD");

	String qID = request.getParameter("questionIDD");
	String output = "";
	String header = "<tr><td><b>Post_ID<b></td><td><b>Question_ID<b></td><td><b>Question</b></td></tr>";
	
	if(pID.equals("") || pID.equals(" ")||qID.equals("") || qID.equals(" "))
	{
		response.sendRedirect("answerErr.jsp");
	}
	else
	{
	
	ApplicationDB db = new ApplicationDB();
	Connection conn = db.getConnection();
	Statement stm = conn.createStatement();	
	
	HttpSession sesh = request.getSession();
	
	sesh.setAttribute("qid",qID);
	sesh.setAttribute("postID",pID);
	
	String str = "SELECT Body,Question_ID,Post_ID FROM Question WHERE Post_ID = '"+pID+"' AND Question_ID = '"+qID+"'";
	
	//Run the query against the database.
	ResultSet result = stm.executeQuery(str);
	
	
	if(result.next()!= false)
	{
		output = output+"<tr><td>"+result.getInt("Post_ID")+"</td><td>"+result.getInt("Question_ID")+"</td><td>"+result.getString("Body")+"</td>";
	}
	}
%>

	<table border=1 style ="display: grid; border: 2px solid; float Left;padding: 5px;grid-template-columns: auto auto;width: 50%;">
	<%=header %>
	<%=output %>
 </table>
 <br>
 
 <form action = "answerInfo.jsp"><%--Submits to postedQuestionPage page --%>
 		
 			Answer Question:<br> <input type = "text" name = "answerr"/>
 		
 			<br/><br/>
 		
 			<input type = "submit" value = "Answer"/>
 		
 		</form>





</body>
</html>