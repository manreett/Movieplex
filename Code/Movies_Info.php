<html>
<head>
<title>Movieplex Movie Info</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
	<link href="style.css" rel="stylesheet">
	
	<meta charset="UTF-8">
	
	
	<style type="text/css">
table{
border:2px solid red;
background-color:cyan;
margin-left:auto;
margin-right:auto;
}
th{border-bottom:5px solid #000;
}
td{border-bottom:2px solid #000;
</style>

</head>

<body>
  <div class="box-area">
	<header>
			<div class="wrapper">
				<div class="logo">
					<a href="#">Movieplex</a>
				</div>

				<nav>
					<a href="movie.php">Home</a>
                    <a href="Movies_Info.php"> Movies Info </a>
                    <a href="Q1.php">Theater Info </a> 
					<a href="MinPrice.php">Tickets</a>
                     </nav>
			</div>
		</header>
		</br>
		</br>
		
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		
		
 <div class= "movies_info">
<h1 text="centre"> Available Movies </h1>
<br>

  
<?php
include('config.php');

$sqlget = "SELECT * FROM movie.movie";
$sqldata=mysqli_query($con,$sqlget)or die('gettin g error');

echo"<table class='table-contents'>";
echo"<tr><th>MovieID</th>
<th>Title</th>
<th>Director</th>
<th>Cast</th>
<th>Description</th>
<th>Duration_min</th>
<th>ReleaseDate</th>
<th>Country</th>";
    
	while ($stmt=mysqli_fetch_array($sqldata ,MYSQLI_ASSOC)) {
	echo"<tr><td>";
	echo $stmt['Movie_ID'];
	echo"</td><td>";
	echo $stmt['Title'];
	echo"</td><td>";
	echo $stmt['Director'];
	echo"</td><td>";
	echo $stmt['Cast'];
	echo"</td><td>";
	echo $stmt['Description'];
	echo"</td><td>";
	echo $stmt['Duration_min'];
	echo"</td><td>";
	echo $stmt['ReleaseDate'];
	echo"</td><td>";
	echo $stmt['Country'];
    echo"</td></tr>";
    }
    
echo"</table>";


?>
</br>
</br>
<br>

<div class="pics">

  
<br>
<div class="text">Venom: Let There Be Carnage</div>
<br>
    <img src="venom.jpg" style="width:20%">
   
  
	<br>
	<br>
	<div class="text">Shang-Chi and the Legend of the Ten Rings</div>
	<br>
    <img src="shang-chi.jpg" style="width:20%">
    <br>



	<br>
	<div class="text">Dune</div>
	<br>
    <img src="dune.jpg" style="width:20%">
   
  
	<br>
	<br>
    <div class="text">Last Night in Soho</div>
	<br>
	
    <img src="lastnightinsoho.jpg" style="width:20%">
   
	<br>
	<br>
	<div class="text">Rons Gone Wrong</div>
	<br>
	<img src="ron.jpg" style="width:20%">
    
	<br>
	<br>
	<div class="text">Clifford the Big Red Dog</div>
	<br>
    <img src="clifford.jpg" style="width:20%">
	<br>
    
	<br>
	<br>
	<h1>More movies coming soon!</h1>
  


 
</br>
</br>
<h1 text="centre"> Available Shows Slots</h1>
<br>
<?php
include('config.php');

$sqlget = "SELECT ShowSlot_ID AS ShowSlot_ID, Date,StartTime FROM showslot

 ";
$sqldata=mysqli_query($con,$sqlget)or die('gettin g error');

echo"<table>";
echo"<tr>
<th>ShowSlot Number</th>
<th>Date</th>
<th>StartTime</th>
</tr>";
    
	while ($stmt=mysqli_fetch_array($sqldata ,MYSQLI_ASSOC)) {
	echo"<tr><td>";
	echo $stmt['ShowSlot_ID'];
	echo"</td><td>";
	echo $stmt['Date'];
	echo"</td><td>";
	echo $stmt['StartTime'];
	echo"</td></tr>";
    }
    
echo"</table>";


?>
</br>
</br>
</br>
</br>
<h1 text="centre">Available Theater Halls </h1>
<?php
include('config.php');

$sqlget = "SELECT Name, TotalTheaterHalls FROM movie.theater WHERE movie.theater.TotalTheaterHalls >= 
(SELECT AVG(TotalTheaterHalls)
 FROM movie.theater) 
 UNION SELECT Name, TotalTheaterHalls FROM movie.theater WHERE Name = 'Maple Theater'

 ";
$sqldata=mysqli_query($con,$sqlget)or die('gettin g error');

echo"<table>";
echo"<tr>
<th>Name of Theater</th>
<th>Theater Halls Available</th>
</tr>";
    
	while ($stmt=mysqli_fetch_array($sqldata ,MYSQLI_ASSOC)) {
	echo"<tr><td>";
	echo $stmt['Name'];
	echo"</td><td>";
	echo $stmt['TotalTheaterHalls'];
	echo"</td></tr>";
    }
    
echo"</table>";


?>

</div>
</body>
</html>