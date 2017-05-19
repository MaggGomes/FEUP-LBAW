<?php
	include_once('../config/init.php');

	$idUser = $_SESSION["id"];
	$idArticle = $_POST["artID"];
	$description = $_POST["description"];

	console_log($_POST);

	$stmt = $conn->prepare("INSERT INTO report (description,state,idArticle,idUser) VALUES (?, 'Pending', ?, ?)");
	$stmt->execute(array($description, $idArticle, $idUser));
	$result = $stmt->fetch();

	header("Location: ../pages/home.php");
?>
