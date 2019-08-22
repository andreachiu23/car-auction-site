<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat, java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*,java.util.StringTokenizer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Bid</title>
</head>
<body>
<%
String full = request.getParameter("vals");
if(full == null)
{
	response.sendRedirect("bidEditErr.jsp");
	return;
}
//tokenize the full string by "|" to get the differnt values
StringTokenizer st = new StringTokenizer(full,"|");
     String user = st.nextToken();
     String amt = st.nextToken();

HttpSession sesh = request.getSession();		
sesh.setAttribute("bidUname",user);
sesh.setAttribute("bidVal",amt);

%>
<form method="post" action="commitEditOfBid.jsp">
 			<select name="action">
 				<option selected disabled>-Select bid edit action-</option>
 				<option value="change">Change Amount</option>	
 				<option value="delete">Delete Bid</option>				
 			</select>	
 			New Value:<input type="text" name="New-Value">	
			<input value="Go" type="submit">	
</form>
</body>
</html>