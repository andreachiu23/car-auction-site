<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat, java.util.Date"%>
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

HttpSession sesh = request.getSession();
String username = (String)sesh.getAttribute("username");

//TEST PARAM****************************************
//username = "USER";
//**************************************************

//Retrieve all parameters
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();


String post = sesh.getAttribute("postID").toString();

int postID = Integer.parseInt(post);
		
Statement stm = con.createStatement();

String query1 = "Select * FROM Item INNER JOIN Auction ON Item.Item_ID = Auction.Item_ID WHERE Post_ID = '"+postID+"'";

double currentbid = 0;
double mbid = 0;
String seller = "";

ResultSet res = stm.executeQuery(query1);
if(res.next()!= false)
{
	currentbid = res.getDouble("Current_Bid");
	mbid = res.getDouble("Min_bid_interval");
	seller = res.getString("Seller_username");
}

//-----------------------------------------------------------

if(seller.equals(username))
{
	db.closeConnection(con);
	response.sendRedirect("displayListingSellerBid.jsp");
}
else
{
	
String sbid = request.getParameter("pbid");

double bid = 0;

if(sbid == null || sbid.equals(""))
{
	bid = 0;
}
else
{
	bid = Double.parseDouble(sbid);
}

if(bid < (currentbid + mbid))
{
	db.closeConnection(con);
	response.sendRedirect("displayListingLowBid.jsp");
}
else
{
	Date date = new Date();
	java.sql.Timestamp cd = new java.sql.Timestamp(date.getTime());
	
	stm = con.createStatement();

	//NEED TO CHANGE TIME POSITION WHEN COMBINING CODE
	String query3 = "INSERT INTO Bid(Post_ID,Time,Amount,Username) VALUES('"+postID+"','"+cd+"','"+bid+"','"+username+"')";
	
	stm.executeUpdate(query3);
	
	String query4 = "UPDATE Auction SET Current_Bid = ('"+bid+"') WHERE Post_ID = '"+postID+"'";
	
	stm.executeUpdate(query4);
	
	
	//------------------------- Code to Send Emails to people bidding saying that a higher bid has been placed
	Statement stmm = con.createStatement();
	
	String q1 = "SELECT DISTINCT Username FROM Bid WHERE Post_ID = '"+postID+"'";
	ResultSet resst = stmm.executeQuery(q1);
	
	
	String msgsub = "Higher bid placed";
	String alertMan = "ALERT";
	String bod = "A higher bid has been placed on Post: " + postID;
	
	String query = "";
	while(resst.next()!= false)
	{	
		query = "INSERT INTO email(toUsername,fromUsername,msgsubject,msgBody,msgTime) VALUES ('"+resst.getString("Username")+"','"+alertMan+"','"+msgsub+"','"+bod+"','"+cd+"')";
		stm.executeUpdate(query);
	}
//---------------------------------------------
	
	
	//Check if an autobid exists, and if so execute it
	String autobidder = "";
	double inc = 0;
	double limit = 0;
	boolean flag = false;
	
	String query5 = "Select * FROM Auto_Bid WHERE Post_ID = '"+postID+"'";
	stm = con.createStatement();
	ResultSet ress = stm.executeQuery(query5);
	if(ress.next()!= false)
	{
		inc = ress.getDouble("Amount");
		limit = ress.getDouble("Max_bid");
		autobidder = ress.getString("Username");
		
		if(bid > limit)
		{
			flag = true;
			
			Date datee = new Date();
			java.sql.Timestamp cd2 = new java.sql.Timestamp(datee.getTime()+1);
			
			//------------------------- Code to Send Emails to people bidding saying that a higher bid has been placed
			Statement stmmm = con.createStatement();
			
			String q7 = "SELECT DISTINCT Username FROM Auto_Bid WHERE Post_ID = '"+postID+"'";
			ResultSet ressit = stmm.executeQuery(q7);
			
			
			String msgsub1 = "Higher bid placed";
			String alertMan1 = "Autobid_Alert";
			String bod1 = "A Bid higher than your Auto Bid Limit has been placed on Post: " + postID;
			
			String querey = "";
			while(ressit.next()!= false)
			{	
				querey = "INSERT INTO email(toUsername,fromUsername,msgsubject,msgBody,msgTime) VALUES ('"+ressit.getString("Username")+"','"+alertMan1+"','"+msgsub+"','"+bod1+"','"+cd2+"')";
				stmmm.executeUpdate(querey);
			}
		//---------------------------------------------
			
		}
		else if((bid + inc) > limit)
		{
			flag = true;
			
			Date datee = new Date();
			java.sql.Timestamp cd2 = new java.sql.Timestamp(datee.getTime()+1);
			
			//------------------------- Code to Send Emails to people bidding saying that a higher bid has been placed
			Statement stmmm = con.createStatement();
			
			String q7 = "SELECT DISTINCT Username FROM Auto_Bid WHERE Post_ID = '"+postID+"'";
			ResultSet ressit = stmm.executeQuery(q7);
			
			
			String msgsub1 = "Higher bid placed";
			String alertMan1 = "Autobid_Alert";
			String bod1 = "A Bid higher than your Auto Bid Limit has been placed on Post: " + postID;
			
			String querey = "";
			while(ressit.next()!= false)
			{	
				querey = "INSERT INTO email(toUsername,fromUsername,msgsubject,msgBody,msgTime) VALUES ('"+ressit.getString("Username")+"','"+alertMan1+"','"+msgsub+"','"+bod1+"','"+cd2+"')";
				stmmm.executeUpdate(querey);
			}
		//---------------------------------------------
			
		}
				
		if(flag == false)
		{
			//insert current bid + increment for autobid user
			double newbid = bid + inc;
			String query6 = "INSERT INTO Bid(Post_ID,Time,Amount,Username) VALUES('"+postID+"','"+cd+"','"+newbid+"','"+autobidder+"')";
					
			stm.executeUpdate(query6);
			
			String query7 = "UPDATE Auction SET Current_Bid = ('"+newbid+"') WHERE Post_ID = '"+postID+"'";
			
			stm.executeUpdate(query7);
		}
	}
	
	
	//was displayListing.jsp
	response.sendRedirect("viewListRedir.jsp");

}

}

%>
</body>
</html>