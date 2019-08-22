 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 	<head>
 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 

 		<title>Post a question </title>
 	</head>
 	
 	
 	
 		<h1><b>Post a question</b></h1>
 		<h2>Fields with the * symbol must be filled out</h2>
 	
 	
 
 <body>
 <body bgcolor="#E6E6FA">
 		<form action = "questionInfo.jsp"><%--Submits to postedQuestionPage page --%>
 		
 			*Message:<br> <input type = "text" name = "message"/>
 		
 			<br/><br/>
 		
 			<input type = "submit" value = "Post"/>
 		
 		</form>
 		
 		<br/>
 		
 		<form action = "Hub.jsp"><%--Submits to postedQuestionPage page --%>
 		

 		
 			<input type = "submit" value = "Return"/>
 		
 		</form>
 		
 		
 		
 		
 
 
 </body>
 
 
 
 </html>