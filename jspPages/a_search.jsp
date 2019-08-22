<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
div.a {
  padding-left: 50px;
}
</style>
<script language="JavaScript">
function toggle(source, name) {
	checkboxes = document.getElementsByName(name);
	for(var i=0, n=checkboxes.length;i<n;i++) {
		checkboxes[i].checked = source.checked;
		}
	}
</script>
<title>Search</title>
</head>

<body>
<body bgcolor="#E6E6FA">
<h1 align = center>Search By:</h1>
  
<form method="post" action="a_computeSearch.jsp">
<b>price:</b><br>
<div class = "a">
minimum: $<input type="text" name="min"> 
maximum: $<input type="text" name="max"> 
</div>
<br>

<b>make:</b>
<div class = "a">
<input type="text" name="make"> 
</div>
<br>

<b>model:</b>
<div class = "a">
<input type="text" name="model"> 
</div>
<br>

<b>year:</b><br>
<div class = "a">
from: <input type="text" name="from"> 
to: <input type="text" name="to"> 
</div>
<br>

<b>mileage:</b><br>
<div class = "a">
under: <input type="text" name="mileage"> 
</div>
<br>

<b>location:</b><br>
<div class = "a">
state: <input type="text" name="location"> 
</div>
<br>

<b>class:</b><br><i>**required to check at least one**</i><br>
<div class = "a">
<b>cars--></b>
<i>all</i> <input type="checkbox" onClick="toggle(this, 'cars')" />
coupe <input type="checkbox" name="cars" value = "Coupe"> 
convertible <input type="checkbox" name="cars" value = "Convertible">
sedan <input type="checkbox" name="cars" value = "Sedan">
hatchback <input type="checkbox" name="cars" value = "Hatchback">
</div>
<div class = "a">
<b>SUVs--></b>
<i>all</i> <input type="checkbox" onClick="toggle(this, 'suvs')" />
small <input type="checkbox" name="suvs" value = "Small"> 
medium <input type="checkbox" name="suvs" value = "Medium">
large <input type="checkbox" name="suvs" value = "Large">
</div>
<div class = "a">
<b>trucks--></b>
<i>all</i> <input type="checkbox" onClick="toggle(this, 'trucks')" />
regular-cab <input type="checkbox" name="trucks" value = "Regular-cab"> 
extended-cab <input type="checkbox" name="trucks" value = "Extended-cab">
crew-cab <input type="checkbox" name="trucks" value = "Crew-cab">
</div>
<div class = "a">
<b>vans--></b>
<i>all</i> <input type="checkbox" onClick="toggle(this, 'vans')" />
mini-van <input type="checkbox" name="vans" value = "Mini-van"> 
passenger van <input type="checkbox" name="vans" value = "Passenger van">
utility van <input type="checkbox" name="vans" value = "Utility van">
</div>
<br>

<b>color:</b><br>
<div class = "a">
<i>all</i> <input type="checkbox" onClick="toggle(this, 'color')" />
beige <input type="checkbox" name="color" value = "Beige"> 
black <input type="checkbox" name="color" value = "Black"> 
blue <input type="checkbox" name="color" value = "Blue"> 
brown <input type="checkbox" name="color" value = "Brown"> 
burgundy <input type="checkbox" name="color" value = "Burgundy"> 
charcoal <input type="checkbox" name="color" value = "Charcoal"> 
gold <input type="checkbox" name="color" value = "Gold"> 
grey <input type="checkbox" name="color" value = "Grey"> 
green <input type="checkbox" name="color" value = "Green"> 
off-white <input type="checkbox" name="color" value = "Off-white"> 
orange <input type="checkbox" name="color" value = "Orange"> 
pink <input type="checkbox" name="color" value = "Pink"> 
purple <input type="checkbox" name="color" value = "Purple"> 
red <input type="checkbox" name="color" value = "Red"> 
silver <input type="checkbox" name="color" value = "Silver"> 
tan <input type="checkbox" name="color" value = "Tan"> 
turquoise <input type="checkbox" name="color" value = "Turquoise"> 
white <input type="checkbox" name="color" value = "White"> 
yellow <input type="checkbox" name="color" value = "Yellow"> 
</div>
<br>

<b>transmission:</b><br>
<div class = "a">
<i>all</i> <input type="checkbox" onClick="toggle(this, 'trans')" />
auto <input type="checkbox" name="trans" value = "Auto"> 
manual <input type="checkbox" name="trans" value = "Manual"> 
CVT <input type="checkbox" name="trans" value = "CVT"> 
DCT <input type="checkbox" name="trans" value = "DCT">
</div>
<br>

<b>drive:</b><br>
<div class = "a">
<i>all</i> <input type="checkbox" onClick="toggle(this, 'drive')" />
FWD <input type="checkbox" name="drive" value = "FWD"> 
RWD <input type="checkbox" name="drive" value = "RWD"> 
AWD <input type="checkbox" name="drive" value = "AWD"> 
4x4 <input type="checkbox" name="drive" value = "4x4">
</div>
<br>

<b>condition:</b><br>
<div class = "a">
<i>all</i> <input type="checkbox" onClick="toggle(this, 'cond')" />
new <input type="checkbox" name="cond" value = "New"> 
excellent <input type="checkbox" name="cond" value = "Excellent"> 
good <input type="checkbox" name="cond" value = "Good"> 
fair <input type="checkbox" name="cond" value = "Fair">
salvage <input type="checkbox" name="cond" value = "Salvage">
</div>
<br>

<b>title status:</b><br>
<div class = "a">
<i>all</i> <input type="checkbox" onClick="toggle(this, 'ts')" />
clean <input type="checkbox" name="ts" value = "Clean"> 
salvage <input type="checkbox" name="ts" value = "Salvage"> 
rebuilt <input type="checkbox" name="ts" value = "Rebuilt"> 
missing <input type="checkbox" name="ts" value = "Missing">
parts only <input type="checkbox" name="ts" value = "Parts only">
</div>
<br>

<b>sort:</b><br>
<div class = "a">
<input type="radio" name="order" value="lowhigh"> low to high<br>
<input type="radio" name="order" value="highlow"> high to low<br>
</div>
<br>

<b>by:</b><br>
<div class = "a">
<input type="radio" name="criteria" value="mileage"> mileage<br>
<input type="radio" name="criteria" value="price"> price<br>
<input type="radio" name="criteria" value="year"> year<br>
</div>
<br>

	<input type="submit" value="submit" >
</form>

</body>
</html>



