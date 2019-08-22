<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat, java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listing</title>
<script type="text/javascript">
function myFunction(seller,user)
{
	if(seller.equals(user))
	{
		request.getParameter("edit").style.visibility="visible";
	}	
}

</script>

</head>

<body bgcolor="#E6E6FA">

<%

int year = 0;
String cat = "";
String sub = "";
String color = "";
String vin = "";
String make =""; 
String model = "";
String trans = "";
String drive = "";
int miles = 0;
String cond = "";
String loc = "";
String title = "";
String image = "";

double starting = 0;
String seller = "";
double mbid = 0;
Date d = new Date();
java.sql.Timestamp end = new java.sql.Timestamp(d.getTime());
double reserve = 0; 
double current = 0;
double endbid = 0;
double newbid = 0;
String user = "";
int itemID = 0;
%>

<%
		
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
	
		
//Retrieve all item information from database
Statement stm = con.createStatement();

HttpSession sesh = request.getSession();

String post = sesh.getAttribute("postID").toString();
user = sesh.getAttribute("username").toString();

int postID = Integer.parseInt(post);
		
Statement stm1 = con.createStatement();

String query1 = "Select * FROM Item INNER JOIN Auction ON Item.Item_ID = Auction.Item_ID WHERE Post_ID = '"+postID+"'";

ResultSet res = stm1.executeQuery(query1);
if(res.next()!= false)
{
	cat = res.getString("Class");
	sub = res.getString("Subclass");
	color = res.getString("Color");
	vin = res.getString("VIN");
	make = res.getString("Make");
	model = res.getString("Model");
	year = res.getInt("Year");
	trans = res.getString("Tranny");
	drive = res.getString("Drive");
	miles = res.getInt("Mileage");
	cond = res.getString("Cond");
	loc = res.getString("Location");
	title = res.getString("Title_status");
	

	starting = res.getDouble("Starting_price");
	seller = res.getString("Seller_username");
	mbid = res.getDouble("Min_bid_interval");
	end = res.getTimestamp("Auction_end_date");
	reserve = res.getDouble("Reserve");
	current = res.getDouble("Current_Bid");
	endbid = res.getDouble("End_Bid");
	itemID = res.getInt("Item_ID");
}
if(current > 0)
{
	newbid = current + mbid;
}
else
	newbid = starting + mbid;

String time = end.toString();
String cur = "" +current;

if(cur.equals("0.0"))
{
	cur = "None";
}

sesh.setAttribute("seller",seller);

String query5 = "Select Username FROM Bid WHERE Post_ID = '"+postID+"' AND Amount = '"+current+"'";
String bidder = "";

ResultSet ress = stm1.executeQuery(query5);
if(ress.next()!= false)
{
	bidder = ress.getString("Username");
}

sesh.setAttribute("bidder",bidder);

%>
<table>
<tr>
		<td>
			<font size = "5"><b><%=year + " " + make + " " + model%></b></font>
		</td>
	</tr>
</table>

<!-- <img alt = "car" src = LOAD_FILE('"+image+"')>-->


<table style="display: inline-block; border: 1px solid; float: left; ">
	<tr>
		<td>
			<b>VIN: </b><%=vin%>
		</td>
	</tr>
	<tr>
		<td>
			<b>Condition: </b><%=cond%>
		</td>
	</tr>
	<tr>
		<td>
			<b>Mileage: </b><%=miles%>
		</td>
	</tr>
	<tr>
		<td>
			<b>Color: </b><%=color%>
		</td>
	</tr>
	<tr>
		<td>
			<b>Transmission: </b><%=trans%>
		</td>
	</tr>
	<tr>
		<td>
			<b>Drive: </b><%=drive%>
		</td>
	</tr>
	<tr>
		<td>
			<b>Title status: </b><%=title%>
		</td>
	</tr>
	<tr>
		<td>
			<b>Location: </b><%=loc%>
		</td>
	</tr>
	<tr>
		<td>
			<b>Class: </b><%=cat%>
		</td>
	</tr>
	<tr>
		<td>
			<b>Subclass: </b><%=sub%>
		</td>
	</tr>
</table>

<form method="post" action="bidVerifySuper.jsp">
<table style="display: inline-block; border: 1px solid;">
	<tr>
		<td>
			<b>Seller: </b><a href="sellerHistory.jsp"><%=seller%></a> 
		</td>
	</tr>
	<tr>
		<td>
			<b>Auction End Date: </b><%=time%>
		</td>
	</tr>
	<tr>
		<td>
			<b>Starting Price: $</b><%=starting%>
		</td>
	</tr>
	<tr>
		<td>
			<b>Current Bid: $</b><%=cur%>
		</td>
	</tr>
	<tr>
		<td>
			<b>Current Bidder: </b><a href="bidderHistory.jsp"><%=bidder%></a> 
		</td>
	</tr>
</table>
<table>
	<tr>
		<td><b>Place a Bid: $</b></td>
		<td><input name="pbid" type="text"></td>
		<td><input value="Place Bid" type="submit"></td>
	</tr>
</table>
<table>
	<tr>
		<td>
			<b>*Cannot bid on your own auction!*</b>
		</td>
	</tr>
	<tr>
		<td>
			<b>*Bid must be at least: $<%=newbid%>*</b>
		</td>
	</tr>
</table>
</form>

<form method="post" action="displayListingOwnSuper.jsp"> 
	<input value="Refresh Listing" type="submit">
</form>


<div class="container" id="button">
    <div class="Button" id="edit" style='visibility:visible'>
		<form method="post" action="editListing.jsp">
			<input value="Edit Listing" type="submit">
		</form>
	</div>
</div>

<table>
	<tr>
		<td>
			<form method="post" action="questionsRedir.jsp">
				<input value="Listing Questions" type="submit">
			</form>
		</td>
	</tr>
</table>

<table>
	<tr>
		<td>
			<form method="post" action="bidHistory.jsp"> 
				<input value="View Auction Bid History" type="submit">
			</form>
		</td>
	</tr>
</table>

<table>
	<tr>
		<td>
			<form method="post" action="viewSimilar.jsp"> 
				<input value="View Similar Auctions" type="submit">
			</form>
		</td>
	</tr>
</table>

<table>
	<tr>
		<td>
			<form method="post"action="a_search.jsp"> 
			<input value="Back to browse" type="submit">
			</form>
		</td>
		<td>
			<form method="post"action="AcctHome.jsp"> 
			<input value="My Account" type="submit">
			</form>
		</td>
	</tr>
</table>

</body>
</html>