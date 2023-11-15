<?php

header('Content-Type: application/json; charset=utf-8');
$con = mysqli_connect ("localhost", "xparttop_flutter", "?iuZstlt)Hi?", "xparttop_flutter");

$sql = "SELECT * FROM users ";
$result = mysqli_query($con, $sql);

$member_detalis = array();


foreach ($result as $item) {

	$name = $item['name'];
	$email = $item['email'];
	$mobile = $item['mobile'];

		$user['name'] = $name ;
		$user['email'] = $email ;
		$user['mobile'] = $mobile ;
		array_push($member_detalis,$user);
}

echo json_encode($member_detalis);



?>