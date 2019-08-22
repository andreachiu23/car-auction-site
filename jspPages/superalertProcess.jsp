<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.math.*,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validating Information...</title>
</head>
<body>
<body bgcolor="#E6E6FA">
<%

//Retrieve all parameters
//String cat = request.getParameter("Category");
String carClass = "";

	
	
	String year = request.getParameter("year");
	String make = request.getParameter("make");
	String model = request.getParameter("model");
	
	if(year.equals("") || year.equals(" ") ||  make.equals("") || make.equals(" ") || model.equals("") || model.equals(" "))
	{
		response.sendRedirect("superalertErr.jsp");
	}
	else
	{
	
		int y = Integer.parseInt(year);
	
		if(y < 1900 || y > 2030)
		{	
			response.sendRedirect("superyearError.jsp");	
		}
		else
		{
		make = make.toLowerCase();
		model = model.toLowerCase();
	
		//Check if required fields have been inserted
	
		if(make.equals("") || model.equals("") || year.equals(""))
		{
		 response.sendRedirect("superalertErr.jsp");	
		}
		else
		{
		
			//Add vehicle information to database
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
		
			HttpSession sesh = request.getSession();
		
		
			Statement stm = con.createStatement();
		
			int alertid = 1;
			
			int temp;
		
			String query1 = "SELECT alertID FROM Item_Alert";
		
			ResultSet res = stm.executeQuery(query1);
			
				while(res.next()!= false)
				{
					temp = res.getInt("alertID");
					
					if(temp > alertid)
					{
						alertid = temp;
					}
				}
				alertid++;
		
			stm = con.createStatement();
				
			String  query = "INSERT INTO Item_Alert (Owner,alertID,Year,Make,Model) values ('"+sesh.getAttribute("username")+"' ,'"+alertid+"','"+y+"','"+make+"','"+model+"')";
		
			stm.executeUpdate(query);
		
			stm = con.createStatement();
			
		
			db.closeConnection(con);
		
		
			response.sendRedirect("superdisplayAlerts.jsp");
		
		}
		
		}
	}

%>
</body>
</html>