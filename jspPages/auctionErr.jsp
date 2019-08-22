<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Auction Details</title>

</head>
<body bgcolor="#E6E6FA">
Enter your auction's details
(Fields with '*' are required) *A required field was missing*
<div>
 		<form method="post" action="auctionVerify.jsp">
		<table>
			<tr>
				<td>*Starting Price</td>
				<td><input type="text" name="startPrice"></td>
			</tr>
			<tr>
				<td>Reserve Price</td>
				<td><input type="text" name="REZ"></td>
			</tr>
			<tr>
				<td>Minimum New Bid Interval</td>
				<td><input type="text" name="minbid"></td>
			</tr>
			<tr>
				<td>*Closing Date (MM/DD/YYYY)</td>
				<td><input type="text" name="closeDate"></td>
			</tr>
			<tr>
				<td>*Closing Time (HH:MI)</td>
				<td><input type="text" name="closeTime"></td>
			</tr>
			
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(00-24:00-59)</td>
			</tr>
		
			<tr>
				<td><input value="List Auction" type="submit"/></td>
			</tr>
		</table>
</form>
</div>
</body>
</html>