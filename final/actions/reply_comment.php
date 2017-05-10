<?php
	include_once('../config/init.php');

    $text = $_POST["comment"];
    $iduser = $_SESSION["id"];
    $idarticle = $_POST["idarticle"];
    $idreply = $_POST["idReply"];

	$stmt = $conn->prepare("INSERT INTO comment (date, text, idarticle, visibility, iduser, idreply) VALUES (LOCALTIMESTAMP, ?, ?, 'Visible', ?, ?)");
	$stmt->execute(array($text, $idarticle, $iduser, $idreply));
	$result = $stmt->fetch();

	$link = 'Location: ../pages/read_article.php?id=' . $idarticle;
	header($link);

?>
