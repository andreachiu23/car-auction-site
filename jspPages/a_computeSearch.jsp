<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Results</title>
</head>
<body>
<body bgcolor="#E6E6FA">
<h1 align = center>Search Results:</h1>

<%
ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement stm = con.createStatement();

boolean prev = false;
boolean onlyType = false;

String query = "";

String model = request.getParameter("model");
if (model != "") {
	if (prev == true) {
		query += "AND ";
	}
	else {
		query = "SELECT Item_ID FROM Item WHERE ";
		prev = true;
	}
	query += "Item.Model LIKE '"+model+"' ";
}

String make = request.getParameter("make");
if (make != "") {
	if (prev == true)
	{
		query += "AND ";
	}
	else
	{
		query = "SELECT Item_ID FROM Item WHERE ";
		prev = true;	
	}
	query += "Item.Make LIKE '"+make+"' ";
}

String checkCars[] = request.getParameterValues("cars");
String checkSUVs[] = request.getParameterValues("suvs");
String checkTrucks[] = request.getParameterValues("trucks");
String checkVans[] = request.getParameterValues("vans");

if (checkCars == null && checkSUVs == null && checkTrucks == null && checkVans == null) {
	response.sendRedirect("a_searchError.jsp");
}
if (checkCars != null || checkSUVs != null || checkTrucks != null || checkVans != null){
	if (prev == true){
		query += " AND (";
	}
	else
	{
		query = "SELECT Item_ID FROM Item WHERE (";
		prev = true;
	}
if (checkCars != null) {
	for (int i = 0; i <checkCars.length; i++){
		query += "Item.Subclass = '"+checkCars[i]+"' ";
		if (i != checkCars.length-1) {
			query += "OR ";
		}
	}
}

if (checkSUVs != null) {
	if (checkCars != null) {
		query += "OR ";
	}
	for (int i = 0; i <checkSUVs.length; i++){
		query += "Item.Subclass = '"+checkSUVs[i]+"' ";
		if (i != checkSUVs.length-1) {
			query += "OR ";
		}
	}
}

if (checkTrucks != null) {
	if (checkSUVs != null || checkCars != null) {
		query += "OR ";
	}
	for (int i = 0; i <checkTrucks.length; i++){
		query += "Item.Subclass = '"+checkTrucks[i]+"' ";
		if (i != checkTrucks.length-1) {
			query += "OR ";
		}
	}
}

if (checkVans != null) {
	if (checkTrucks != null || checkSUVs != null || checkCars != null) {
		query += "OR ";
	}
	for (int i = 0; i <checkVans.length; i++){
		query += "Item.Subclass = '"+checkVans[i]+"' ";
		if (i != checkVans.length-1) {
			query += "OR ";
		}
	}
}
query += ") ";
}

String checkColors[] = request.getParameterValues("color");
if (checkColors != null) {
	if (prev == true) {
		query += " AND (";
	}
	else {
		query = "SELECT Item_ID FROM Item WHERE ";
		prev = true;
	}
	for (int i= 0; i < checkColors.length; i++){
		query += "Item.Color = '"+checkColors[i]+"' ";
		if (i != checkColors.length-1){
			query += "OR ";
		}
	}
	query += ") ";
}

String checkTrans[] = request.getParameterValues("trans");
if (checkTrans != null) {
	if (prev == true) {
		query += " AND (";
	}
	else {
		query = "SELECT Item_ID FROM Item WHERE ";
		prev = true;
	}
	for (int i= 0; i < checkTrans.length; i++){
		query += "Item.Tranny = '"+checkTrans[i]+"' ";
		if (i != checkTrans.length-1){
			query += "OR ";
		}
	}
	query += ") ";
}

String checkDrive[] = request.getParameterValues("drive");
if (checkDrive != null) {
	if (prev == true) {
		query += "AND (";
	}
	else {
		query = "SELECT Item_ID FROM Item WHERE ";
		prev = true;
	}
	for (int i= 0; i < checkDrive.length; i++){
		query += "Item.Drive = '"+checkDrive[i]+"' ";
		if (i != checkDrive.length-1){
			query += "OR ";
		}
	}
	query += ") ";
}

String checkCond[] = request.getParameterValues("cond");
if (checkCond != null) {
	if (prev = true) {
		query += "AND (";
	}
	else {
		query = "SELECT Item_ID FROM Item WHERE ";
		prev = true;
	}
	for (int i= 0; i < checkCond.length; i++){
		query += "Item.Cond = '"+checkCond[i]+"' ";
		if (i != checkCond.length-1){
			query += "OR ";
		}
	}
	query += ") ";
}

String checkTS[] = request.getParameterValues("ts");
if (checkTS != null) {
	if (prev == true) {
		query += "AND (";
	}
	else {
		query = "SELECT Item_ID FROM Item WHERE ";
		prev = true; 
	}
	for (int i= 0; i < checkTS.length; i++){
		query += "Item.Title_status = '"+checkTS[i]+"' ";
		if (i != checkTS.length-1){
			query += "OR ";
		}
	}
	query += ") ";
}

String getFrom = request.getParameter("from");
if (getFrom != "") {
	if (prev == true) {
		query += "AND ";
	}
	else {
		query = "SELECT Item_ID FROM Item WHERE ";
		prev = true; 
	}
	int from = Integer.parseInt(getFrom);
	query += "Item.Year >= '"+from+"' ";	
}
String getTo = request.getParameter("to");
if (getTo != "") {
	if (prev == true) {
		query += "AND ";
	}
	else {
		query = "SELECT Item_ID FROM Item WHERE ";
		prev = true; 
	}
	int to = Integer.parseInt(getTo);
	query += "Item.Year <= '"+to+"' ";	
}

String getMileage = request.getParameter("mileage");
if (getMileage != ""){
	if (prev == true) {
		query += "AND ";
	}
	else {
		query = "SELECT Item_ID FROM Item WHERE ";
		prev = true; 
	}
	int mileage = Integer.parseInt(getMileage);
	query += "Item.Mileage < '"+mileage+"' ";
}

String getLoc = request.getParameter("location");
if (getLoc != ""){
	if (prev == true) {
		query += "AND ";
	}
	else {
		query = "SELECT Item_ID FROM Item WHERE ";
		prev = true; 
	}
	query += "Item.Location LIKE '"+getLoc+"' ";
}

String finalQuery = "";
if (query != "") {
	query = "AND Auction.Item_ID IN ("+query+") ";
}
String getMin = request.getParameter("min");
String getMax = request.getParameter("max");
if (getMin == "" && getMax == "") {
	finalQuery = "SELECT Auction.Post_ID as Post_ID, Auction.Starting_price as Start_price, Auction.Current_Bid as Current_Bid, Item.Make as Make, Item.Model as Model,Item.Mileage as Mileage, Item.Year as Year FROM Auction join Item WHERE Auction.Item_ID = Item.Item_ID " + query + " ";
}
else if (getMin == "" && getMax != "") {
	double max = Double.parseDouble(getMax);
	finalQuery = "SELECT Auction.Post_ID as Post_ID, Auction.Starting_price as Start_price, Auction.Current_Bid as Current_Bid, Item.Make as Make, Item.Model as Model,Item.Mileage as Mileage, Item.Year as Year FROM Auction join Item WHERE Auction.Item_ID = Item.Item_ID and Auction.Starting_price < "+max+" " + query + " ";
}	
else if (getMin != "" && getMax == "") {
	double min = Double.parseDouble(getMin);
	finalQuery = "SELECT Auction.Post_ID as Post_ID, Auction.Starting_price as Start_price, Auction.Current_Bid as Current_Bid, Item.Make as Make, Item.Model as Model,Item.Mileage as Mileage, Item.Year as Year FROM Auction join Item WHERE Auction.Item_ID = Item.Item_ID AND Auction.Starting_price >= "+min+" " + query + " ";
}
else {
	double min = Double.parseDouble(getMin);
	double max = Double.parseDouble(getMax);
	finalQuery = "SELECT Auction.Post_ID as Post_ID, Auction.Starting_price as Start_price, Auction.Current_Bid as Current_Bid, Item.Make as Make, Item.Model as Model,Item.Mileage as Mileage, Item.Year as Year FROM Auction join Item WHERE Auction.Item_ID = Item.Item_ID and Auction.Starting_price < "+max+" AND Auction.Starting_price >= "+min+" "+ query + " ";
	
}

String order = request.getParameter("order");
String criteria = request.getParameter("criteria");

if (order != null)
{
	if (order.equals("lowhigh")) {
		if (criteria.equals("mileage")){
			finalQuery += "ORDER BY Mileage ASC";
		}
		else if (criteria.equals("price")){
			finalQuery += "ORDER BY Start_price ASC";
		}	
		else if (criteria.equals("year")){
			finalQuery += "ORDER BY Year ASC";
		}
	}
	else if (order.equals("highlow")) {
		if (criteria.equals("mileage")){
			finalQuery += "ORDER BY Mileage DESC";
		}
		else if (criteria.equals("price")){
			finalQuery += "ORDER BY Start_price DESC";
		}
		else if (criteria.equals("year")){
			finalQuery += "ORDER BY Year DESC";
		}
	}
}

ResultSet result = stm.executeQuery(finalQuery);
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