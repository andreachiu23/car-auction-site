<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales report</title>
</head>
<body>
<body bgcolor="#E6E6FA">
<%
String reportType = request.getParameter("CreateReport");

if(reportType == null)
{
	response.sendRedirect("createReportErr.jsp");
	return;
}

ApplicationDB db = new ApplicationDB();
Connection conn = db.getConnection();
Statement stm = conn.createStatement();	
String query = "";
String header = "";
ResultSet result;

if(reportType.equals("totalEarnings"))
{
	query = "SELECT 'Total Earnings' as A, sum(Auction.End_Bid) as B from Auction where End_Bid >= 0;";
	header = "<tr><td><b>Sales Report:</b></td></tr><tr><td><b>Title:</b></td><td><b>Value:</b></td></tr>";
}
if(reportType.equals("earningsPerItem"))
{
	query = "SELECT Item_ID as A, Auction.End_Bid as B from Auction where End_Bid >= 0;";
	header = "<tr><td><b>Earnings Per Vehicle:</b></td></tr><tr><td><b>Item Id:</b></td><td><b>Final Bid:</b></td></tr>";
}
if(reportType.equals("earningsPerClass"))
{
	query = "SELECT Item.Class as A, sum(Auction.End_Bid) as B from Auction join Item where Auction.Item_ID = Item.Item_ID and Auction.End_Bid >=0 group by Item.class;";
	header = "<tr><td><b>Earnings Per Vehicle Class:</b></td></tr><tr><td><b>Vehicle Class:</b></td><td><b>Earnings:</b></td></tr>";
}
if(reportType.equals("earningsPerUser"))
{
	query = "SELECT Seller_username as A, sum(Auction.End_Bid) as B from Auction where Auction.End_Bid >=0 and Seller_username <> '-deletedAccount-' group by Seller_username;";
	header = "<tr><td><b>Earnings Per User:</b></td></tr><tr><td><b>Username:</b></td><td><b>Earnings:</b></td></tr>";
}
if(reportType.equals("bestSellingItems"))
{
	double avgVal = 0;
	int i = 0;
	query = "SELECT sum(Auction.End_Bid) as users from Auction join Item where Auction.Item_ID = Item.Item_ID and Auction.End_Bid >=0 group by Item.class;";
	result = stm.executeQuery(query);
	while(result.next()!=false)
	{
		i++;
		avgVal = avgVal + result.getDouble("users");
	}
	avgVal = avgVal/i;
	
	query = "SELECT Item.Class as A, sum(Auction.End_Bid) as B from Auction join Item where Auction.Item_ID = Item.Item_ID and Auction.End_Bid >=0 group by Item.class having sum(Auction.End_Bid) >= "+avgVal;
	header = "<tr><td><b>Best Selling Vehicles:</b></td></tr><tr><td><b>Vehicle class:</b></td><td><b>Gross Selling Price:</b></td></tr>";	
}
if(reportType.equals("bestBuyers"))
{
	double avgVal = 0;
	int i = 0;
	query = "select sum(Auction.End_Bid) as users from Auction join Bid where Auction.End_Bid >=0 and Auction.Post_ID = Bid.Post_ID and Bid.Amount = Auction.End_Bid group by Bid.Username";
	result = stm.executeQuery(query);
	while(result.next()!=false)
	{
		i++;
		avgVal = avgVal + result.getDouble("users");
	}
	avgVal = avgVal/i;
	
	query = "select Username as A, sum(Auction.End_Bid) as B from Auction join Bid where Auction.End_Bid >=0 and Auction.Post_ID = Bid.Post_ID and Bid.Amount = Auction.End_Bid and Bid.Username <> '-deletedAccount-' group by Bid.Username having sum(Auction.End_Bid) >= "+avgVal;
	header = "<tr><td><b>Best Buyers:</b></td></tr><tr><td><b>Username:</b></td><td><b>Total Spent:</b></td></tr>";
}
if(query.equals(""))
{
	response.sendRedirect("createReportErr.jsp");
	return;
}
result = stm.executeQuery(query);
String output = "";
while(result.next()!=false)
{
		output = output+"<tr><td>"+result.getString("A")+"</td><td>$"+result.getDouble("B")+"</td></tr>";
}
%>
<table border=1 style ="display: inline-block; border: 1px solid; float Left; ">
<%=header%>
<%=output%>
</table>
<form method="post" action="AcctHome.jsp">
		<table>
			<tr>
				<td><input type="submit" value="Back"></td>
			</tr>
		</table>
	</form>
</body>
</html>