<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat, java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,com.cs3361.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bid Update Successful!</title>
</head>
<body>
<%
//add code here to update or delete
String action = request.getParameter("action");
if(action == null)
{
	response.sendRedirect("bidEditErr.jsp");
	return;
}
HttpSession sesh = request.getSession();		
String name = (String)sesh.getAttribute("bidUname");
String valStr = (String)sesh.getAttribute("bidVal");
double val = Double.parseDouble(valStr);
Integer postIdint = (Integer)sesh.getAttribute("postID");
int postId = postIdint.intValue();
String query = "";

ApplicationDB db = new ApplicationDB();
Connection con = db.getConnection();
Statement stm = con.createStatement();

if(action.equals("change"))
{
	String newValStr = request.getParameter("New-Value");
	if(newValStr == null)
	{
		response.sendRedirect("bidEditErr.jsp");
		return;
	}
	double newVal = Double.parseDouble(newValStr);
	
	query = "UPDATE Bid set Amount = "+newVal+" where Post_ID = "+postId+" and Amount = "+val+" and Username = '"+name+"';";

}
if(action.equals("delete"))
{
	query = "Delete from Bid where Post_ID = "+postId+" and Amount = "+val+" and Username = '"+name+"'";
}
stm.executeUpdate(query);

//get new maxBid from bid table
	double maxFromBid=0;
	double temp;
	query = "SELECT Amount from Bid where Post_ID = "+postId;
	ResultSet resl = stm.executeQuery(query);
	while(resl.next()!= false)
	{
		temp = resl.getDouble("Amount");
		if(temp > maxFromBid)
		{
			maxFromBid = temp;
		}
	}
	
	//get current  maxBid of auction
	double currentMax =0;
	query = "Select Current_Bid from Auction where Post_ID = "+postId;
	ResultSet res2 = stm.executeQuery(query);
	if(res2.next() != false)
	{
		currentMax = res2.getDouble("Current_Bid");
	}
	
//check if maxFromBid is 0 or if maxFromBid != currentMax
	if(maxFromBid ==0 || maxFromBid != currentMax)
	{
		query = "update Auction set Current_Bid = "+maxFromBid+" where Post_ID ="+postId;
	}
stm.executeUpdate(query);
db.closeConnection(con);
%>
Bid updated successfully!
<form method="post" action="viewListRedir.jsp">
		<table>
			<tr>
				<td><input type="submit" value="Back to Listing"></td>
			</tr>
		</table>
	</form>
</body>
</html>