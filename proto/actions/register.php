<?php
	include_once('../../config/init.php');
	$name = strip_tags($_POST["name"]);
	$email = strip_tags($_POST["email"]);
	$password = hash("sha256", $_POST["password"]);

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


	header('Location: ../../pages/home.php');

 ?>
