<?php

	include_once('../../config/init.php');
	include_once("../../database/user.php");

	$name = strip_tags($_POST["name"]);
	$email = strip_tags($_POST["email"]);
	$password = password_hash($_POST["password"], PASSWORD_DEFAULT);

	$result = getUser($email);
	if($result){
	   $error = "Fail: This email is already in use";
	   die ($error);
	}

	$stmt = $conn->prepare("INSERT INTO public.Users (name, email, password) VALUES (?, ?, ?)");
	$stmt->execute(array($name, $email, $password));
	$result = $stmt->fetch();
	$result = getUser($email);

	global $smarty;

	$_SESSION['email'] = $email;
	$_SESSION['username'] = $name;
	$_SESSION["id"] = $result["id"];

	header('Location: ../../pages/home.php');

?>
