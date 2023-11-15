
<?php
$con = mysqli_connect ("localhost", "xparttop_flutter", "?iuZstlt)Hi?", "xparttop_flutter");

$name = $_GET['name'];
$email = $_GET['email'];
$mobile = $_GET['mobile'];

$sql = "INSERT INTO users (name, email, mobile ) VALUES ('$name', '$email', '$mobile') ";
$result = mysqli_query ($con,$sql);

if($result) echo "inserted" ;
else echo "Something Is Wrong!!!" ;



?>