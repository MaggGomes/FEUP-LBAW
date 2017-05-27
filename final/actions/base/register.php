<?php
	include_once('../../config/init.php');
	include_once("../../database/user.php");

	$name = strip_tags($_POST["name"]);
	$email = strip_tags($_POST["email"]);
	$password = password_hash($_POST["password"], PASSWORD_DEFAULT);
	$status = 200;

	$result = getUser($email);
	if($result){
	   $error = "Fail: This email is already in use";
	   $status = 400;
	}

	if($status == 200){
		$stmt = $conn->prepare("INSERT INTO public.Users (name, email, password) VALUES (?, ?, ?)");
		$stmt->execute(array($name, $email, $password));
		$result = $stmt->fetch();
		$result = getUser($email);

		global $smarty;

		$_SESSION['email'] = $email;
		$_SESSION['username'] = $name;
		$_SESSION["id"] = $result["id"];
	}

	echo json_encode($status);
?>
