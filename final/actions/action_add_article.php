<?php
	include_once('../config/init.php');

	$title = $_POST["title"];
	$abstract = $_POST["abstract"];
	$category = $_POST["options"];

	$text = $_POST["body"];

	if(!isset($_SESSION["id"]))
	{
		die("No session");
	}
/*
	echo $title;

	echo $abstract;

	echo $category;

	echo $text;*/

	$stmt = $conn->prepare("INSERT INTO public.article (abstract, title, date, content, category, idUser, visibility) VALUES (?, ?, LOCALTIMESTAMP, ?, ?, ?, 'Visible')");
	$stmt->execute(array($abstract, $title, $text, $category, $_SESSION["id"]));
	$result = $stmt->fetch();

	$stmt = $conn->prepare("SELECT idArticle FROM public.article WHERE abstract = ? AND title = ?");
	$stmt->execute(array($abstract, $title));
	$result = $stmt->fetchAll();

	$idarticle = $result[0]["idarticle"];

	if(isset($_POST["tags"])){
		$tags = explode(" ", $_POST["tags"]);

		foreach ($tags as $value) {
			$stmt = $conn->prepare("SELECT id FROM public.tags WHERE tag = ?");
			$stmt->execute(array($value));
			$result = $stmt->fetchAll();
			$idtag = $result[0]["id"];

			if(empty($result)){
				$stmt = $conn->prepare("INSERT INTO public.tags (tag) VALUES (?)");
				$stmt->execute(array($value));
				$result = $stmt->fetch();

				$stmt = $conn->prepare("SELECT id FROM public.tags WHERE tag = ?");
				$stmt->execute(array($value));
				$result = $stmt->fetchAll();
				$idtag = $result[0]["id"];

			}

			$stmt = $conn->prepare("INSERT INTO public.linktag (idTag, idArticle) VALUES (?, ?)");
			$stmt->execute(array($idtag, $idarticle));
			$result = $stmt->fetch();
		}
	}

	$link = 'Location: ../pages/read_article.php?id=' . $idarticle;
	header($link);
?>
