<?php
	include_once('../config/init.php');

	$iduser = $_SESSION["id"];
	$idarticle = $_POST["idArt"];

	console_log($idsuser);
	die($iduser);
	/*$text = $_POST["comment"];
		$idreply = $_POST["idReply"];

	$stmt = $conn->prepare("INSERT INTO comment (date, text, idarticle, visibility, iduser, idreply) VALUES (LOCALTIMESTAMP, ?, ?, 'Visible', ?, ?)");
	$stmt->execute(array($text, $idarticle, $iduser, $idreply));
	$result = $stmt->fetch();*/

	header("Location: ../pages/home.php");

?>
