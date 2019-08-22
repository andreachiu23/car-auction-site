<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 	<head>
 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 

 		<title> Super Message board Hub </title>
 	</head>
 	
 	
 	
 		<h1><b>Listing Questions Hub</b></h1>
 	
 	
 
 <body>
 
 <body bgcolor="#E6E6FA">
 		<form action = "superPostQuestion.jsp">
 		
 		Please Choose an action:<br><br>
 		<input type = "submit" value = "Post a question"/>
 		
 		</form>
 		
 		<form action = "ssuperPostedQuestions2.jsp">
 		
		<br>
 		<input type = "submit" value = "Search/Browse posted questions"/>
 		
 		</form>
 		
 		<form action = "viewListRedir.jsp">
 		
 		<br><%--Return to login page --%>
 		<input type = "submit" value = "Return to Listing page"/>
 		
 		</form>
 		
 		
 		
 
 
 </body>
 
 
 
 </html>