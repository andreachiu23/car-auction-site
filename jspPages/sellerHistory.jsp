<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat, java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seller History</title>

</head>
<body bgcolor="#E6E6FA">
<%

HttpSession sesh = request.getSession();


//Retrieve all parameters
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();


String seller = sesh.getAttribute("seller").toString();




		
Statement stm = con.createStatement();

String query1 = "Select * FROM Auction WHERE Seller_username = '"+seller+"'";
String output = "";
String user = "";
int itemID = 0;
double starting = 0;
double current = 0;
double endbid = 0;
double amount = 0;
Date d = new Date();
java.sql.Timestamp starttime = new java.sql.Timestamp(d.getTime());
Date dd = new Date();
java.sql.Timestamp endtime = new java.sql.Timestamp(dd.getTime());
String et = "";
String st = "";
int post = 0;

ResultSet res = stm.executeQuery(query1);
while(res.next()!= false)
{
	post = res.getInt("Post_ID");
	user = res.getString("Seller_username");
	endtime = res.getTimestamp("Auction_end_date");
	et = endtime.toString();
	starttime = res.getTimestamp("post_date");
	st = starttime.toString();
	starting = res.getDouble("Starting_price");
	endbid = res.getDouble("End_Bid");
	itemID = res.getInt("Item_ID");
	output = output +"<tr><td>" + post +"</td><td>" + itemID + "</td><td>" + user + "</td><td>" + starting + "</td><td>" + endbid + "</td><td>" + st + "</td><td>" + et + "</td></tr>";
}
String hpost = "PostID";
String hitem = "ItemID";
String huser = "User";
String hstart = "Start Price";
String hendp = "End Price";
String hstime = "Start Time";
String hetime = "End Time";

String header = "<th>" + hpost + "<th>" + hitem + "<th>" + huser + "<th>" + hstart + "<th>" + hendp + "<th>" + hstime + "<th>" + hetime;

db.closeConnection(con);
%>
<b>Sell History</b>
<table border=1>
<%=header%>
<%=output%>
</table>
<form method="post" action="viewListRedir.jsp"> 
	<input value="Back" type="submit">
</form>

</body>
</html>