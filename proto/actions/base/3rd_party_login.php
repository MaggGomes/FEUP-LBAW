<?php
	include_once('../../config/init.php');
	$name = strip_tags($_POST["name"]);
	$email = strip_tags($_POST["email"]);
	$image = strip_tags($_POST["imageUrl"]);
	$password = $_POST[""];
	$platform = strip_tags($_POST["platform"]);;

	$users = $conn->prepare("SELECT * FROM public.Users WHERE email = ?");
	$users->execute(array($email));
	$result = $users->fetch();

	if(!$result){
		$stmt = $conn->prepare("INSERT INTO public.Users (name, email, password, imageUrl) VALUES (?, ?, ?, ?)"); 
		$stmt->execute(array($name, $email, $password, $image));
		$result = $stmt->fetch();
		$result = getUser($email);
	}

	$_SESSION["email"] = $email;
	$_SESSION["id"] = $result["id"];
	$_SESSION["username"] = $name;

	header('Location: ../../pages/home.php');
 ?>
