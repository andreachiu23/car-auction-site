<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 	<head>
 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 

 		<title> Answer Questions</title>
 	</head>
 	
 	
 	
 		<h1><b>Answer Questions</b></h1>
 	
 	
 
 <body>
 <body bgcolor="#E6E6FA">
 
 <%
 	out.print("This is where you select which question you want to answer ");

%>


 			<br>
 			
<form action = "enterAnswer.jsp"><%--Submits to postedQuestionPage page --%>
 		
 			Enter the PostID of the Question you want to answer:<br> <input type = "text" name = "postIDD"/>
 			
 			<br>
 			
 			Enter the QuestionID of the Question you want to answer:<br> <input type = "text" name = "questionIDD"/>
 		
 			<br/><br/>
 		
 			<input type = "submit" value = "Answer Question"/>
 			</form>
 			<br>
 			
 			<form action = "superPostedQuestions.jsp"><%--Submits to postedQuestionPage page --%>
 		
 			<input type = "submit" value = "Return"/>
 			</form>
 			
 <%-- 
 	<form action = "superHub.jsp">
 		
 		<br><%--Return to login page 
 		<input type = "submit" value = "Return to Hub"/>
 		</form>
  --%>
  <br><br>
  
 
	
 
 
 </body>
 
 </html>