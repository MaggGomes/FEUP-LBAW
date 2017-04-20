<?php
	include_once("../../config/init.php");
	include_once("../../database/user.php");
	$email = strip_tags($_POST["email"]);
	$password = $_POST["password"];

	$result = getUser($email);
	if(!$result){
	   $error = "There is no account with this email";
	   die ($error);
	}

	if(!password_verify($password, $result["password"])){
		header($_SERVER["SERVER_PROTOCOL"]."400 Bad Request");
		die("Fail: Incorrect password");
	}

	$_SESSION["email"] = $email;
	$_SESSION["id"] = $result["id"];
	$_SESSION["username"] = $result["name"];

	header("Location: ../../pages/home.php");
 ?>
