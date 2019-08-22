<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body bgcolor="#E6E6FA">
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String username = request.getParameter("username");
String password = request.getParameter("password");
String password2 = request.getParameter("password2");

if(name.equals("")||email.equals("")|| username.equals("")||
		password.equals("") || password2.equals("")||
		!(password.equals(password2)))
{
   response.sendRedirect("RepRegisterErr.jsp");	
}

else
{
	//connect to db
	ApplicationDB db = new ApplicationDB();
	Connection conn = db.getConnection();
	
	
	Statement stm = conn.createStatement();			
	
	String qr = "SELECT Username, email FROM Account WHERE Username ='"+username+"'";
	
	ResultSet res = stm.executeQuery(qr);
	if(res.next()!= false)
	{
		String un = res.getString("Username");
		if(!(un.equals("")))
		{
			response.sendRedirect("RepalreadyExists.jsp");
		}
	}

	
	else
	{
	
	stm = conn.createStatement();
	String  query = "INSERT INTO Account (Username,Password,Name,Email) values ('"+username+"','"+password+"','"+name+"','"+email+"')";
	stm.executeUpdate(query);
	
	int maxVal=0;
	int temp;
	//query here to select all rep_ids then do a while next not null loop to get max id
	query = "SELECT Rep_id from Customer_Rep_Account";
	ResultSet resl = stm.executeQuery(query);
	while(resl.next()!= false)
	{
		temp = resl.getInt("Rep_id");
		
		if(temp > maxVal)
		{
			maxVal = temp;
		}
	}
	maxVal++;
	//add 1 to max id and thats new val

	Statement stmt = conn.createStatement();
	
	String querye = "INSERT INTO Customer_Rep_Account (Rep_id,Username) values ("+maxVal+",'"+username+"')";
	
	stmt.executeUpdate(querye);

	response.sendRedirect("RepRegSucc.jsp");
	}
	
	db.closeConnection(conn);
}
%>
</body>
</html>