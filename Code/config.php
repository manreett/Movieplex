<?php
    $host = "127.0.0.1";
    $user = "root";                     //Your Cloud 9 username
    $pass = "";                                  //Remember, there is NO password by default!
    $db = "movie";                                  //Your database name you want to connect to
    //$port = 80;
     $con = mysqli_connect($host, $user, $pass, $db)or die(mysql_error());
?>