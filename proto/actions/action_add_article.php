<?php
	include_once('../config/init.php');

	$title = $_POST["title"];
	$abstract = $_POST["abstract"];
	$category = $_POST["options"];

	$text = $_POST["body"];

/*
	echo $title;

	echo $abstract;

	echo $category;

	echo $text;*/

	$stmt = $conn->prepare("INSERT INTO public.article (abstract, title, date, content, category, idUser, visibility) VALUES (?, ?, LOCALTIMESTAMP, ?, ?, ?, 'Visible')");
	$stmt->execute(array($abstract, $title, $text, $category, 51));
	$result = $stmt->fetch();

	//header('Location: ../../proto/pages/home.php');
?>
