<?php
	include_once('../../config/init.php');
	$email = strip_tags($_POST["email"]);
	$password = $_POST["password"];

	$users = $conn->prepare("SELECT * FROM public.Users WHERE email = ?");
	$users->execute(array($email));
	$result = $users->fetch();
	if(!$result){
	   $error = "There is no account with this email";
	   die ($error);
	}

	if(!password_verify($password, $result["password"])){
		header($_SERVER["SERVER_PROTOCOL"]."400 Bad Request");
		die("Fail: Incorrect password");
	}

	$_SESSION["email"] = $email;
	$_SESSION["username"] = $result["name"];

	header('Location: ../../pages/home.php');
 ?>
