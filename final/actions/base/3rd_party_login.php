<?php
	include_once('../../config/init.php');
	include_once("../../database/user.php");

	$name = strip_tags($_POST["username"]);
	$email = strip_tags($_POST["email"]);
	$image = strip_tags($_POST["imageUrl"]);
	$password = $_POST[""];
	$platform = strip_tags($_POST["platform"]);

	$result = getUser($email);
	if(!$result){
		$stmt = $conn->prepare("INSERT INTO public.users (name, email, password, photourl) VALUES (?, ?, ?, ?)");
		$stmt->execute(array($name, $email, $password, $image));
		$result = $stmt->fetch();
		$result = getUser($email);
	}

	$_SESSION["email"] = $email;
	$_SESSION["id"] = $result["id"];
	$_SESSION["username"] = $name;
	$_SESSION["photo"] = $result["photourl"];

	header('Location: ../../pages/home.php');
 ?>
