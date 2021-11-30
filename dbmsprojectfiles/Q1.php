<html>
    <head> 

    <title>Movieplex Search Information</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
	<link href="style.css" rel="stylesheet">
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
                    <a href="Movies_Info.php"> Movies Info</a>
                    <a href="Q1.php">Theater Info</a> 
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
							<form method="post" "$_SERVER[PHP_SELF] >
 <h3 text="centre">Enter the Name Of the Movie to search below:</h3>
 </br>
    <input type="text" name="liname">
    <input type="submit" value="Search" name="submit"> 
	
</form>

<?php
function display()
{

	include('config.php');
	
			$sqlget = "SELECT * 
                       FROM movie.movie
                       WHERE Title='".$_POST["liname"]."' ";
                       $sqldata=mysqli_query($con,$sqlget)or die('gettin g error');
            echo"<table>";
echo"<table>";
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
            
        

}
if(isset($_POST['submit']))
{
   display();
} 
?>

</br>
<h3> Theaters Information   </h3>
<br>
<!--Joing Three Tables  -->
<?php
include('config.php');

$sqlget = "SELECT movie.city.Name,movie.city.Province, movie.theater.Name,movie.theater.TotalTheaterHalls, movie.theaterhall.Name,movie.theaterhall.Total_Seats FROM movie.city JOIN movie.theater ON movie.city.City_ID=movie.theater.City_ID 
JOIN movie.theaterhall 
ON movie.theater.Theater_ID=movie.theaterhall.Theater_ID ";
$sqldata=mysqli_query($con,$sqlget)or die('gettin g error');

echo"<table>";
echo"<tr>
<th>City</th>
<th>Province</th>
<th>TheaterName</th>
<th>TotalTheaterHalls</th>
<th>TheaterName</th>
<th>Total_seats</th>
</tr>";
    
	while ($stmt=mysqli_fetch_array($sqldata ,MYSQLI_ASSOC)) {
	echo"<tr><td>";
	echo $stmt['Name'];
	echo"</td><td>";
	echo $stmt['Province'];
	echo"</td><td>";
	echo $stmt['Name'];
	echo"</td><td>";
	echo $stmt['TotalTheaterHalls'];
	echo"</td><td>";
	echo $stmt['Name'];
	echo"</td><td>";
	echo $stmt['Total_Seats'];
    echo"</td></tr>";
    }
    
echo"</table>";


?>
</br>
</br>
<br>
<h3 >Theaters Having More Than More Than 150 Seats </h3>
<br>
<?php
include('config.php');

$sqlget = "
SELECT theaterhall.Name, theaterhall.Total_Seats
 FROM theaterhall WHERE Total_Seats > ANY (SELECT Total_Seats FROM theaterhall WHERE TheaterHall_ID =5 GROUP BY Name) ";
$sqldata=mysqli_query($con,$sqlget)or die('gettin g error');

echo"<table>";
echo"<tr>
<th>TheaterName</th>
<th>Seats Available </th>
</tr>";
    
	while ($stmt=mysqli_fetch_array($sqldata ,MYSQLI_ASSOC)) {
	echo"<tr><td>";
	echo $stmt['Name'];
	echo"</td><td>";
	echo $stmt['Total_Seats'];
    echo"</td></tr>";
    }
    
echo"</table>";
?>
</br>
</br>
<h3 text="centre"> Available Seat Number At Present </h3>
<?php
include('config.php');

$sqlget = "SELECT movie.theaterhall.Name, movie.theater_seat.TheaterSeat_ID 
FROM movie.theaterhall LEFT JOIN movie.theater_seat ON movie.theaterhall.TheaterHall_ID=movie.theater_seat.TheaterHall_ID
 UNION SELECT movie.theaterhall.Name, movie.theater_seat.TheaterSeat_ID FROM movie.theaterhall RIGHT JOIN movie.theater_seat
 ON movie.theaterhall.TheaterHall_ID=movie.theater_seat.TheaterHall_ID  ";
$sqldata=mysqli_query($con,$sqlget)or die('gettin g error');

echo"<table>";
echo"<tr>
<th>Theater Name</th>
<th>Seat Number </th>

</tr>";
    
	while ($stmt=mysqli_fetch_array($sqldata ,MYSQLI_ASSOC)) {
	echo"<tr><td>";
	echo $stmt['Name'];
	echo"</td><td>";
	echo $stmt['TheaterSeat_ID'];
    echo"</td></tr>";
    }
    
echo"</table>";


?>
</br>
</br>

</div>

</body>
</html>