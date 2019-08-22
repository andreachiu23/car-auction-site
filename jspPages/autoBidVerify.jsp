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
//username = "REP";
//**************************************************

//Retrieve all parameters
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();

Statement stm = con.createStatement();

String post = sesh.getAttribute("postID").toString();
String user = sesh.getAttribute("username").toString();

int postID = Integer.parseInt(post);

//Check if user already has an autobid set for this auction

String q = "SELECT * FROM Auto_Bid WHERE Username = '"+user+"' AND Post_ID = '"+postID+"'";
	
ResultSet result = stm.executeQuery(q);
if(result.next()!= false)
{
	db.closeConnection(con);
	sesh.setAttribute("auto","auto");
	response.sendRedirect("viewListRedir.jsp");	
	return;
}



String init = request.getParameter("initial");
String inc = request.getParameter("inc");
String lim = request.getParameter("limit");


double initial = Double.parseDouble(init);
double increment = Double.parseDouble(inc);
double limit = Double.parseDouble(lim);

Date date = new Date();
java.sql.Timestamp cd = new java.sql.Timestamp(date.getTime());
		
double in = 0;
double current = 0;
stm = con.createStatement();
String qry = "SELECT * from Auction WHERE Post_ID = '"+postID+"'";
ResultSet res = stm.executeQuery(qry);
if(res.next()!= false)
{
	current = res.getDouble("Current_Bid");
	in = res.getDouble("Min_bid_interval");
}

//check if the initial auto bid to be set is lower than the current bid
System.out.println("current:" + current);
System.out.println("initial:" + initial);
if((current + in) >= initial)
{
	db.closeConnection(con);
	sesh.setAttribute("auto","auto");
	response.sendRedirect("viewListRedir.jsp");	
	return;
}


stm = con.createStatement();
String query = "INSERT INTO Auto_Bid(Post_ID,Time,Amount,Username,Max_bid,Starting_bid) VALUES('"+postID+"','"+cd+"','"+inc+"','"+username+"','"+limit+"','"+initial+"')";
stm.executeUpdate(query);

stm = con.createStatement();
String query3 = "INSERT INTO Bid(Post_ID,Time,Amount,Username) VALUES('"+postID+"','"+cd+"','"+initial+"','"+username+"')";
stm.executeUpdate(query3);

stm = con.createStatement();
String query4 = "UPDATE Auction SET Current_Bid = ('"+initial+"') WHERE Post_ID = '"+postID+"'";
stm.executeUpdate(query4);

db.closeConnection(con);

response.sendRedirect("viewListRedir.jsp");

%>
</body>
</html>