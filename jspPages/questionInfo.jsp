<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" content="2;url=postedQuestionsPage.jsp">
<title> Question Info</title>
</head>

<body>
<body bgcolor="#E6E6FA">
<%

//connect to db
		ApplicationDB db = new ApplicationDB();
		Connection conn = db.getConnection();
		Statement stm = conn.createStatement();	
		
		HttpSession sesh = request.getSession();
		
		String message = request.getParameter("message");
		
		if(message.equals("") || message.equals(" "))
		{
			response.sendRedirect("postqErr.jsp");
		}
		else
		{
		
		int id = Integer.parseInt(sesh.getAttribute("postID").toString());
		
		int maxVal = 0;
		
		int temp;
		
		String ans = "N/A";
		
		//String ansU = "N/A";
		
		String queryy = "SELECT Question_ID from Question Where Post_ID ='"+id+"'";
		
		ResultSet resl = stm.executeQuery(queryy);
		
		while(resl.next()!= false)
		{
			temp = resl.getInt("Question_ID");
			
			if(temp > maxVal)
			{
				maxVal = temp;
			}
		}
		
		maxVal++;
		
		String query = "";
	
		query = "INSERT INTO Question(Question_ID,Username,answerUser,Post_ID, Body,answer) VALUES ("+maxVal+",'"+sesh.getAttribute("username")+"',null,"+id+",'"+message+"','"+ans+"')";
	
		stm.executeUpdate(query);
		
		
		out.println("Redirecting to Posted Questions...");
		
		db.closeConnection(conn);
		
		}
		
		
%>

</body>

</html>