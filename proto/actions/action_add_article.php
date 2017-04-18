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

	header('Location: ../../pages/home.php');
?>
