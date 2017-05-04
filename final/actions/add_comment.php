<?php
	include_once('../config/init.php');

    $text = $_POST["comment"];
    $iduser = $_SESSION["id"];
    $idarticle = $_POST["idarticle"];

	$stmt = $conn->prepare("INSERT INTO comment (date, text, idarticle, visibility, iduser) VALUES (LOCALTIMESTAMP, ?, ?, 'Visible', ?)");
	$stmt->execute(array($text, $idarticle, $iduser));
	$result = $stmt->fetch();

	$link = 'Location: ../pages/read_article.php?id=' . $idarticle;
	header($link);

?>
