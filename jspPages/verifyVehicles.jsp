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
String cat = request.getParameter("Category");
String carClass = "";



if(cat == null || cat.equals(""))
{
	response.sendRedirect("vehicleErr.jsp");
}
else
{
	

	

	if(cat.equals("Car"))
	{
		carClass = request.getParameter("Car");
	}
	if(cat.equals("Truck"))
	{
		carClass = request.getParameter("Truck");
	}
	if(cat.equals("SUV"))
	{
		carClass = request.getParameter("SUV");
	}
	if(cat.equals("Van"))
	{
		carClass = request.getParameter("Van");
	}
	
	
	String year = request.getParameter("year");
	String make = request.getParameter("make");
	String model = request.getParameter("model");
	String vin = request.getParameter("vin");
	String miles = request.getParameter("miles");
	String color = request.getParameter("color");
	String trans = request.getParameter("trans");
	String drive = request.getParameter("drive");
	String cond = request.getParameter("cond");
	String title = request.getParameter("title");
	String location = request.getParameter("location");


	
	//Test parameters

	
	//Check if required fields have been inserted
	
	if(vin.equals("") || make.equals("") || model.equals("") || year.equals("") || miles.equals("") || location.equals("") ||carClass == null || carClass.equals(""))
	{
		 response.sendRedirect("vehicleErr.jsp");	
	}
	else
	{
		
		//Set unrequired fields to space if they were left blank
		if(color.equals(""))
		{
			color = " ";
		}
		if(trans == null || trans.equals(""))
		{
			trans = " ";
		}
		if(drive == null || drive.equals(""))
		{
			drive = " ";
		}
		if(cond == null || cond.equals(""))
		{
			cond = " ";
		}
		if(title == null || title.equals(""))
		{
			title = " ";
		}
		
	
		
		
		//Check if miles is greater than 0, and if year is valid (> 1900)
		
		int y = Integer.parseInt(year);
		int m = Integer.parseInt(miles);
		
		if(m < 0)
		{
			response.sendRedirect("vehicleErr.jsp");	
		}
		if(y < 1900 || y > 2030)
		{	
			response.sendRedirect("vehicleErr.jsp");	
		}
		
		//Add vehicle information to database
		
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		
		Statement stm = con.createStatement();
		
		//Assigns a unique Item_ID
		int itemID = 1;
		
		String query1 = "SELECT Item_ID FROM Item";
		
		ResultSet res = stm.executeQuery(query1);
		if(res.next()!= false)
		{
			int id = res.getInt("Item_ID");
			while(res.next()!= false)
			{
				id = res.getInt("Item_ID");
			}
			itemID = id + 1;
		}
		
		stm = con.createStatement();
				
		String  query = "INSERT INTO Item (Item_ID,Class,Subclass,Year,Make,Model,VIN,Mileage,Color,Tranny,Drive,Cond,Title_status,Location) values ('"+itemID+"','"+cat+"','"+carClass+"','"+y+"','"+make+"','"+model+"','"+vin+"','"+m+"','"+color+"','"+trans+"','"+drive+"','"+cond+"','"+title+"','"+location+"')";
		
		stm.executeUpdate(query);
		
		stm = con.createStatement();

		//_______________________Alert user if listing matches criteria_______
		HttpSession sesh = request.getSession();
		
		make = make.toLowerCase();
		model = model.toLowerCase();
		
		Statement stmm = con.createStatement();
		
		String q1 = "SELECT Owner,alertID FROM Item_Alert WHERE year = '"+y+"' AND make = '"+make+"' AND model = '"+model+"'";
		ResultSet ress = stmm.executeQuery(q1);
		
		if(ress.next()!= false)
		{			
			sesh.setAttribute("owner",ress.getString("Owner"));
			sesh.setAttribute("alertid",ress.getString("alertID"));
			response.sendRedirect("alertMatch.jsp");
			db.closeConnection(con);
			return;
		}
		//_______________________________________________

		db.closeConnection(con);
		response.sendRedirect("auctionDetails.jsp");
		return;
		
	}
}
%>
</body>
</html>