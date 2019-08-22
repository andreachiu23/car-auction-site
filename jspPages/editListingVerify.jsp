<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.math.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Validating Information...</title>
</head>
<body>
<%

//Retrieve all parameters
String cat = request.getParameter("cat");;
String newVal = "";
String query = "";
int itemID = 0;
int intVal = 0;
double dVal = 0;
System.out.println(cat);

if(cat == null || cat.equals(""))
{
	System.out.println(cat);
	response.sendRedirect("editListingErr.jsp");
}
else
{
	HttpSession sesh = request.getSession();

	String post = sesh.getAttribute("postID").toString();
	int postID = Integer.parseInt(post);
	
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();
	
	
	Statement stm = con.createStatement();
	
	String query1 = "Select * FROM Item INNER JOIN Auction ON Item.Item_ID = Auction.Item_ID WHERE Post_ID = '"+postID+"'";
	
	ResultSet res = stm.executeQuery(query1);
	if(res.next()!= false)
	{
		itemID = res.getInt("Item_ID");
	}

	if(cat.equals("Class"))
	{
		newVal = request.getParameter("New");
		query = "UPDATE Item SET Class = '"+newVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("Subclass"))
	{
		newVal = request.getParameter("New");
		query = "UPDATE Item SET Subclass = '"+newVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("Color"))
	{
		newVal = request.getParameter("New");
		query = "UPDATE Item SET Color = '"+newVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("VIN"))
	{
		newVal = request.getParameter("New");
		query = "UPDATE Item SET VIN = '"+newVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("Make"))
	{
		newVal = request.getParameter("New");
		query = "UPDATE Item SET Make = '"+newVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("Model"))
	{
		newVal = request.getParameter("New");
		query = "UPDATE Item SET Model = '"+newVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("Trans"))
	{
		newVal = request.getParameter("New");
		query = "UPDATE Item SET Tranny = '"+newVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("Drive"))
	{
		newVal = request.getParameter("New");
		query = "UPDATE Item SET Drive = '"+newVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("Cond"))
	{
		newVal = request.getParameter("New");
		query = "UPDATE Item SET Cond = '"+newVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("Title"))
	{
		newVal = request.getParameter("New");
		query = "UPDATE Item SET Title_status = '"+newVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("Location"))
	{
		newVal = request.getParameter("New");
		query = "UPDATE Item SET Location = '"+newVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("Year"))
	{
		newVal = request.getParameter("New");
		intVal = Integer.parseInt(newVal);
		query = "UPDATE Item SET Year = '"+intVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("Mileage"))
	{
		newVal = request.getParameter("New");
		intVal = Integer.parseInt(newVal);
		query = "UPDATE Item SET Mileage = '"+intVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("Reserve"))
	{
		newVal = request.getParameter("New");
		dVal = Double.parseDouble(newVal);
		query = "UPDATE Auction SET Reserve = '"+dVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("MinBid"))
	{
		newVal = request.getParameter("New");
		dVal = Double.parseDouble(newVal);
		query = "UPDATE Auction SET Min_bid_interval = '"+dVal+"' WHERE Item_ID = '"+itemID+"'";
	}
	else if(cat.equals("delete"))
	{
		query = "delete from Bid where Post_ID = "+Integer.parseInt(sesh.getAttribute("postID").toString());
		stm.executeUpdate(query);
		query = "delete from Item where Item_ID = "+itemID;
		stm.executeUpdate(query);
		db.closeConnection(con);
		response.sendRedirect("listingDeleted.jsp");
		return;
	}
	
		stm = con.createStatement();
		stm.executeUpdate(query);
		db.closeConnection(con);
		response.sendRedirect("viewListRedir.jsp");
		return;
		
}

%>
</body>
</html>