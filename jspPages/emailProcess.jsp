<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" content="2;url=emailHub.jsp">
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
		
		String userToo = request.getParameter("userTo");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		//Check if fields are left blank first
		if(userToo.equals("") || userToo.equals(" ") ||  subject.equals("") || subject.equals(" ") || message.equals("") || message.equals(" "))
		{
			response.sendRedirect("emailErr.jsp");
		}
		else
		{
		
		//Check if username is in Account Second
		String checkq = "";
		String temp = "";
		String testF = "no";//Start as no
		
		checkq = "SELECT Username FROM Account";
		
		ResultSet resCheck = stm.executeQuery(checkq);
		
		while(resCheck.next()!= false)
		{
			temp = resCheck.getString("Username");
			
			if(userToo.equals(temp))//If username is found in account change flag to yes
			{
				testF = "yes";
			}
		}
		
		
		if(testF.equals("no"))//If not found in database redirect to error page
		{
			response.sendRedirect("emailErr2.jsp");
			
		}
		else if(testF.equals("yes"))//If found continue as normal
		{
	
		Date date = new Date();
		java.sql.Date cd = new java.sql.Date(date.getTime());
	    java.sql.Timestamp ct = new java.sql.Timestamp(cd.getTime());
		 
		
		String query = "";
		
		query = "INSERT INTO email(toUsername,fromUsername,msgsubject,msgBody,msgTime) VALUES ('"+userToo+"','"+sesh.getAttribute("username")+"','"+subject+"','"+message+"','"+ct+"')";
	
		stm.executeUpdate(query);
		
		out.println("Redirecting to Emails...");
		
		db.closeConnection(conn);
		
		
		}//End of else Statement
		
		}
		
%>

</body>

</html>