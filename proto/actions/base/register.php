<?php

	include_once('../../config/init.php');

	$name = strip_tags($_POST["name"]);
	$email = strip_tags($_POST["email"]);
	$password = password_hash($_POST["password"], PASSWORD_DEFAULT);

	$users = $conn->prepare("SELECT * FROM public.Users WHERE email = ?");
	$users->execute(array($email));
	$result = $users->fetch();
	if($result){
	   $error = "Fail: This email is already in use";
	   die ($error);
	}

	$stmt = $conn->prepare("INSERT INTO public.Users (name, email, password) VALUES (?, ?, ?)");
	$stmt->execute(array($name, $email, $password));
	$result = $stmt->fetch();

	global $smarty;
	
	$_SESSION['email'] = $email;
	$_SESSION['username'] = $name;
	header('Location: ../../pages/home.php');

?>
