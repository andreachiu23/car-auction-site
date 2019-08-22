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

//String username = "ADMIN"; 
//sesh.setAttribute("username",username);

//Retrieve all parameters
String itemID = "";
String startPrice = "";
String reserve = request.getParameter("REZ");
String closeDate = "";
String closeTime = "";
String minbid = request.getParameter("minbid");
double start = 0;
double current = 0;
double mbid = 0;
double end = -1;
double res;
int item = 0;
boolean flag = false;


if(reserve == null || reserve.equals(""))
{
	res = 0;
}
else
{
	res = Double.parseDouble(reserve);
}

if(minbid == null || minbid.equals(""))
{
	mbid = 0;
}
else
{
	mbid = Double.parseDouble(minbid);
}


//Check if required fields have been inserted


if(request.getParameter("startPrice") == null) 
{
	flag = true;	
}
else
{
	startPrice = request.getParameter("startPrice");
	start = Double.parseDouble(startPrice);
}

if(request.getParameter("closeDate") == null)
{
	flag = true;
}
else
{
	closeDate = request.getParameter("closeDate");
}


if(request.getParameter("closeTime") == null)
{
	flag = true;
}
else
{
	closeTime = request.getParameter("closeTime");
}

if(flag)
{
	response.sendRedirect("auctionErr.jsp");
	return;
}



ApplicationDB db = new ApplicationDB();
Connection conn = db.getConnection();

Statement stm = conn.createStatement();

//GRAB ITEM ID
String query = "SELECT Item_ID FROM Item";

ResultSet result = stm.executeQuery(query);
while(result.next()!= false)
{
	item = result.getInt("Item_ID");
}


//GENERATE UNIQUE AUCTION ID
String query2 = "SELECT Post_ID FROM Auction";
		
	int postID = 1;
	//String query1 = "Select Item_ID FROM Item INNER JOIN Auction ON Item.Item_ID = Auction.Item_ID WHERE Item_ID = '"+itemID+"'";

	ResultSet rez = stm.executeQuery(query2);
	if(rez.next()!= false)
	{
		int id = rez.getInt("Post_ID");
		while(rez.next()!= false)
		{
			id = rez.getInt("Post_ID");
		}
		postID = id + 1;
	}
		
		
		
		//Process closing date and time
		String[] closeTimes = closeTime.split(":");
		String closeTimeH = closeTimes[0];
		String closeTimeM = closeTimes[1];
		int ctH = Integer.parseInt(closeTimeH);
		int ctM = Integer.parseInt(closeTimeM);
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm");
		Date d = sdf.parse(closeDate + " " + closeTime);
		java.sql.Date sd = new java.sql.Date(d.getTime());
		java.sql.Timestamp st = new java.sql.Timestamp(sd.getTime());
		//sd.setHours(ctH);
		//sd.setMinutes(ctM);
		Date date = new Date();
		java.sql.Date cd = new java.sql.Date(date.getTime());
		java.sql.Timestamp ct = new java.sql.Timestamp(cd.getTime());
		
		System.out.println("Current: " + ct.toString());
		System.out.println("Starting: " + st.toString());
		int status=sd.compareTo(cd);
		
		

		if(status<=0) //If startdate is older or equal to current time
		{
			db.closeConnection(conn);
			response.sendRedirect("auctionDateErr.jsp");
			return;
		}
		
		
		String insert = "insert into Auction values (?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(insert);
		ps.setInt(1,postID);
		ps.setInt(2,item);
		ps.setDouble(3,start);
		ps.setString(4,username);
		ps.setDouble(5,mbid);
		ps.setTimestamp(6, st);
		ps.setDouble(7,res);
		ps.setDouble(8,current);
		ps.setDouble(9,end);
		ps.setTimestamp(10,ct);
		ps.executeUpdate(); 


		sesh.setAttribute("postID",postID);
		
db.closeConnection(conn);
response.sendRedirect("displayListingOwner.jsp");



%>
</body>
</html>