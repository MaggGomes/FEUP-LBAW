<?php
	include_once('../config/init.php');
	include_once('../database/article.php');

	$text = $_POST["text"];
	$idcomment = $_POST["idcomment"];
    $idarticle = $_POST["idarticle"];


	if(!isset($_SESSION["id"])) {
		die("No session");
	}

	$stmt = $conn->prepare('UPDATE "comment" SET text = ? WHERE idcomment = ?');
	$stmt->execute(array($text, $idcomment));
	$result = $stmt->fetch();

	$link = 'Location: ../pages/read_article.php?id=' . $idarticle;
	header($link);
?>
