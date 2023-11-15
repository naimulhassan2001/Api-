
<?php

$con = mysqli_connect ("localhost", "xparttop_flutter", "?iuZstlt)Hi?", "xparttop_flutter");


$mobile = $_GET['mobile'];
$name = $_GET['name'];
$email = $_GET['email'];

$sql = "UPDATE users SET name ='$name', mobile ='$mobile' WHERE email ='$email' " ;
$result = mysqli_query($con,$sql);

if($result) echo "Updated" ;
else echo "Something Is Wrong!!!" ;

?>