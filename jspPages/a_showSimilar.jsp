<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Similar Items</title>
</head>
<body>
<body bgcolor="#E6E6FA">
<h1 align = center>Similar Items:</h1>
<p> Here are similar auctions from 30 days ago or less. </p>
<%
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement stm = con.createStatement();
HttpSession sesh = request.getSession();
String post = sesh.getAttribute("postID").toString();
int postID = Integer.parseInt(post);
		
Timestamp timestamp = new Timestamp(new Date().getTime());
Calendar cal = Calendar.getInstance();
cal.setTimeInMillis(timestamp.getTime());
// subtract 30 days
cal.setTimeInMillis(timestamp.getTime());
cal.add(Calendar.DAY_OF_MONTH, -30);
timestamp = new Timestamp(cal.getTime().getTime());

String query = "SELECT Auction.Post_ID as Post_ID, Auction.Starting_price as Start_price, Auction.Current_Bid as Current_Bid, Item.Make as Make, Item.Model as Model,Item.Mileage as Mileage, Item.Year as Year FROM Auction join Item WHERE post_date >= '"+timestamp+"' AND Auction.Item_ID = Item.Item_ID";
ResultSet result = stm.executeQuery(query);
String output = "";

while (result.next() != false) {
	 output = output+"<form method=\"post\" action=\"setupListRedir.jsp\"><tr><td><input name=\"postID\" type=\"submit\" value="+result.getString("Post_ID")+"></td><td>"+result.getString("Start_price")+"</td><td>"+result.getString("Current_Bid")+"</td><td>"+result.getString("Make")+"</td><td>"+result.getString("Model")+"</td><td>"+result.getString("Mileage")+"</td><td>"+result.getString("Year")+"</td></tr></form>";
}

db.closeConnection(con);
String header = "<tr><td><b>Results:</b></td></tr><tr><td><b>Post ID:</b></td><td><b>Starting Price:</b></td><td><b>Current Bid:</b></td><td><b>Make:</b></td><td><b>Model:</b></td><td><b>Mileage:</b></td><td><b>Year:</b></td></tr>";
%>

<table>
<%=header%>
<%=output%>
</table>


</body>
</html>