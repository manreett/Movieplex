<html>
<head>
<title>Movieplex Search Movies</title>
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
                    <a href="Movies_Info.php"> Movies Info </a>
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
 </br>
 </br>
 </br>
 <h3 text="centre"> Movie Released in United States </h3>
 
  <?php
include('config.php');

$sqlget = " SELECT Movie_ID, Title FROM movie WHERE Country= 'United States of America'";
$sqldata=mysqli_query($con,$sqlget)or die('gettin g error');

echo"<table>";
echo"<tr>
<th>Year of Release  </th>
<th>Movie Title </th>
</tr>";
    
	while ($stmt=mysqli_fetch_array($sqldata ,MYSQLI_ASSOC)) {
	echo"<tr><td>";
	echo $stmt['Movie_ID'];
	echo"</td><td>";
	echo $stmt['Title'];
    echo"</td></tr>";
    }
    
echo"</table>";


?>
</br>
</br>
 <h3>No of Seats Available</h3>
 
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


<form method="post">
	   <h3 style="centre">Click below to see the movie with maximum or minimum price :</h3>
	   </br>
        <input type="submit" name="MaxPrice"
                class="button" value="MaxPrice" align="left" />
				
     <input type="submit" name="MinPrice"
                class="button" value="MinPrice" align="right" />
				</tr>
			
    </form>
	</br>
	</br>
  
<?php

 if(array_key_exists('MinPrice', $_POST)) {
            MinPrice();
        }
        else if(array_key_exists('MaxPrice', $_POST)) {
            MaxPrice();
        }
        function MinPrice() {
			include('config.php');
			$sqlget ="SELECT *
                     FROM movie.showseat
                     WHERE Price =  
                    (SELECT MIN(price) 
                     FROM movie.showseat)";
$sqldata=mysqli_query($con,$sqlget)or die('gettin g error');
            echo"<table>";
echo"<tr>
<th>SeatNO</th>
<th>Price</th>
<th>TheaterNo</th>
<th>ShowSlot</th>
<th>Reservation_Id</th>
</tr>";
    
	while ($stmt=mysqli_fetch_array($sqldata ,MYSQLI_ASSOC)) {
	echo"<tr><td>";
	echo $stmt['Showseat_ID'];
	echo"</td><td>";
	echo $stmt['Price'];
	echo"</td><td>";
	echo $stmt['TheaterSeat_ID'];
	echo"</td><td>";
	echo $stmt['ShowSlot_ID'];
	echo"</td><td>";
	echo $stmt['Reservation_ID'];
    echo"</td></tr>";
    }
    
echo"</table>";

        }
		
        function  MaxPrice() {
						include('config.php');
			$sqlget = "SELECT *
                     FROM movie.showseat
                     WHERE Price =  
                    (SELECT MAX(price) 
                     FROM movie.showseat)";
$sqldata=mysqli_query($con,$sqlget)or die('gettin g error');
            echo"<table>";
echo"<tr>
<th>SeatNO</th>
<th>Price</th>
<th>TheaterNo</th>
<th>ShowSlot</th>
<th>Reservation_Id</th>
</tr>";
    
	while ($stmt=mysqli_fetch_array($sqldata ,MYSQLI_ASSOC)) {
	echo"<tr><td>";
	echo $stmt['Showseat_ID'];
	echo"</td><td>";
	echo $stmt['Price'];
	echo"</td><td>";
	echo $stmt['TheaterSeat_ID'];
	echo"</td><td>";
	echo $stmt['ShowSlot_ID'];
	echo"</td><td>";
	echo $stmt['Reservation_ID'];
    echo"</td></tr>";
    }
    
echo"</table>";
            
        }


?>
</br>
</br>


				 
</div>
</body>
</html>