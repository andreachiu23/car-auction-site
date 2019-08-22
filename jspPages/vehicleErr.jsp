<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create an Auction</title>
<script type="text/javascript">

function checkvalue(val)
{
	if(val == "Car")
	{
		Car.style.visibility = "visible";
		SUV.style.visibility = "hidden";
		Truck.style.visibility = "hidden";
		Van.style.visibility = "hidden";
	}
	if(val == "SUV")
	{	
		SUV.style.visibility = "visible";
		Car.style.visibility = "hidden";
		Truck.style.visibility = "hidden";
		Van.style.visibility = "hidden";
	}
	if(val == "Truck")
	{
		Truck.style.visibility = "visible";
		SUV.style.visibility = "hidden";
		Car.style.visibility = "hidden";
		Van.style.visibility = "hidden";
	}
	if(val == "Van")
	{
		Van.style.visibility = "visible";
		SUV.style.visibility = "hidden";
		Car.style.visibility = "hidden";
		Truck.style.visibility = "hidden";
	}
}
</script>




</head>
<body bgcolor="#E6E6FA">
Enter your vehicle details
(Fields with '*' are required)
*A required field was missing*
	<div>
 		<form method="post" action="verifyVehicles.jsp">
 			*
 			<select name="Category" onchange="checkvalue(this.options[this.selectedIndex].value)">
 				<option selected disabled>-Select Car Category-</option>
 				<option value="Car">Car</option>
 				<option value="Suv">SUV</option>
 				<option value="Truck">Truck</option>
 				<option value="Van">Van</option>
 			</select>
 			
 			<div class="container" id="second">
    			<div class="Car" id="Car" style='visibility:hidden'>
    			*
        			<select name = "Car">
        				<option selected disabled>-Class-</option>
            			<option value="Coupe">Coupe</option>
            			<option value="Convertible">Convertible</option>
            			<option value="Sedan">Sedan</option>
            			<option value="Hatchback">Hatchback</option>
        			</select>
    			</div>
    			<div class="SUV" id="SUV" style='visibility:hidden'>
    			*
        			<select name = "SUV">
        				<option selected disabled>-Size-</option>
            			<option value="Small">Small</option>
            			<option value="Mid-size">Mid-Size</option>
            			<option value="Large">Large</option>
        			</select>
    			</div>
    			<div class="Truck" id="Truck" style='visibility:hidden'>
    			*
        			<select name = "Truck">
        				<option selected disabled>-Cab Size-</option>
            			<option value="Regular-cab">Regular-Cab</option>
            			<option value="Extended-cab">Extended-Cab</option>
            			<option value="Crew-cab">Crew-Cab</option>
        			</select>
    			</div>
    			<div class="Van" id="Van" style='visibility:hidden'>
    			*
        			<select name = "Van">
        				<option selected disabled>-Function-</option>
            			<option value="Mini-van">Mini-van</option>
            			<option value="Passenger van">Passenger Van</option>
            			<option value="Utility van">Utility Van</option>
        			</select>
    			</div>
			</div>
			
			
			
			Insert vehicle specifications
			<table>
			<tr>
				<td>*Year</td>
				<td><input type="text" name="year"></td>
			</tr>
			<tr>
				<td>*Make</td>
				<td><input type="text" name="make"></td>
			</tr>
			<tr>
				<td>*Model</td>
				<td><input type="text" name="model"></td>
			</tr>
			<tr>
				<td>*VIN</td>
				<td><input type="text" name="vin"></td>
			</tr>
			<tr>
				<td>*Mileage</td>
				<td><input type="text" name="miles"></td>
			</tr>
			<tr>
				<td>Color</td>
				<td><input type="text" name="color"></td>
			</tr>
			
			<tr>
   				<td class = "select">Transmission</td>   
    		<td>
       			 <select name = "trans">  
       				<option value="">-Select Transmission Type-</option>      
            		<option value="Auto">Auto</option>
            		<option value="Manual">Manual</option>
            		<option value="CVT">CVT</option>
           			<option value="DCT">DCT</option>
      			</select>
    		</td>        
			</tr>
			
			<tr>
   				<td class = "select">Drive</td>   
    		<td>
       			<select name = "drive">
       				<option value="">-Select Drive Type-</option>        
            		<option value="FWD">FWD</option>
            		<option value="RWD">RWD</option>
            		<option value="AWD">AWD</option>
           			<option value="4x4">4x4</option>
      			</select>
    		</td>        
			</tr>
			
			<tr>
   				<td class = "select">Condition</td>   
    		<td>
       			<select name ="cond">
       				<option value="">-Select Condition-</option>        
            		<option value="New">New</option>
            		<option value="Excellent">Excellent</option>
            		<option value="Good">Good</option>
           			<option value="Fair">Fair</option>
           			<option value="Salvage">Salvage</option>
      			</select>
    		</td>        
			</tr>
			
			<tr>
   				<td class = "select">Title Status</td>   
    		<td>
       			<select name = "title">
       				<option value="">-Select Title Status-</option>        
            		<option value="Clean">Clean</option>
            		<option value="Salvage">Salvage</option>
            		<option value="Rebuilt">Rebuilt</option>
           			<option value="Missing">Missing</option>
           			<option value="Parts only">Parts Only</option>
      			</select>
    		</td>        
			</tr>
				
			<tr>
				<td>*Location (XX)</td>
				<td><input type="text" name="location"></td>
  				</tr>	
  				
  			<tr>
				<td><input value="Next" type="submit"/></td>
			</tr>
			</table>
 		</form>
 		
 		<form method="post" action="listAuction.jsp">
				<input value="Cancel" type="submit">
		</form>
			
 	</div>
</body>
</html>