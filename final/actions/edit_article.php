<?php
	include_once('../config/init.php');
	include_once('../database/article.php');

	$title = $_POST["title"];
	$abstract = $_POST["abstract"];
	$category = $_POST["options"];
    $idarticle = $_POST["articleid"];

	$text = $_POST["body"];

	if(!isset($_SESSION["id"])) {
		die("No session");
	}

	$stmt = $conn->prepare('UPDATE "article" SET abstract = ?, title = ?, content = ?, category = ? WHERE idarticle = ?');
	$stmt->execute(array($abstract, $title, $text, $category, $idarticle));
	$result = $stmt->fetch();


	if(strlen($_FILES['articlePicture']['name']) > 0){
		$articlePhoto = uploadArticlePhoto();
		if($articlePhoto !== false){
			$stmt = $conn->prepare('UPDATE "image" SET url = ? WHERE idarticle = ? ');
			$stmt->execute(array($articlePhoto, $idarticle));
		}
	}


	$link = 'Location: ../pages/read_article.php?id=' . $idarticle;
	header($link);
?>
