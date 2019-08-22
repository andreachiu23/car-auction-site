<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
 	<head>
 		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 		
 		<title> Posted questions </title>
 	</head>
 	
 	
 	
 	<h1>Posted Questions</h1>
 	
 
 
 <body>
 <body bgcolor="#E6E6FA">
 
 <form action = "superListingQuestions.jsp">
 		
 		
 		<input type = "submit" value = "Return"/>
 		
 		</form>
 
 		
 	     <br><br>
 		
<% 
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			HttpSession sesh = request.getSession();
			
			int id = Integer.parseInt(sesh.getAttribute("postID").toString());
			
			String str = "SELECT Body,answer,answerUser,Question_ID,Post_ID FROM Question WHERE Post_ID = '"+id+"'";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			String output = "";
			String header = "<tr><td><b>Post_ID<b></td><td><b>Question_ID<b></td><td><b>Question</b></td><td><b>Answerer</b></td><td><b>Answer</b></td></tr>";
	while(result.next()!= false)
	{
		//output = output+result.getString("Body")+"<br>";
		output = output+"<tr><td>"+result.getInt("Post_ID")+"</td><td>"+result.getInt("Question_ID")+"</td><td>"+result.getString("Body")+"</td><td>"+result.getString("answerUser")+"</td><td>"+result.getString("answer")+"</td></tr>";
	}
%>

 <form action = "answerQuestions.jsp">
 		
 		
 		<input type = "submit" value = "Answer Question"/>
 		
 		</form>
 		
 		<br>
 		
<table border=1 style ="display: grid; border: 2px solid; float Left;padding: 5px;grid-template-columns: auto auto;width: 50%;">
	<%=header %>
	<%=output %>
 </table>
 
 </body>
 
 
 
 </html>