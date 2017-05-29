<?php
	include_once('../config/init.php');

	$idUser = $_SESSION["id"];
	$repID = $_POST["repID"];
	$description = $_POST["description"];

	$stmt = $conn->prepare("INSERT INTO report (description,state,idArticle,idUser) VALUES (?, 'Pending', ?, ?)");
	$stmt->execute(array($description, $repID, $idUser));
	$result = $stmt->fetch();

	header("Location: ../pages/home.php");
?>
