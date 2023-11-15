


<?php

$email = $_GET['email'];

$con = mysqli_connect ("localhost", "xparttop_flutter", "?iuZstlt)Hi?", "xparttop_flutter");


$sql = "DELETE FROM users WHERE email ='$email'" ;
$result = mysqli_query($con, $sql);

if($result) echo "Deleted" ;
else echo "Something Is Wrong!!!" ;

?>