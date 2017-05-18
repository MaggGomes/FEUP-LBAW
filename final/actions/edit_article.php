<?php
	include_once('../config/init.php');
	include_once('../database/article.php');

	$title = $_POST["title"];
	$abstract = $_POST["abstract"];
	$category = $_POST["options"];
    $idarticle = $_POST["articleid"];

	$text = $_POST["body"];

	if(!isset($_SESSION["id"]))
	{
		die("No session");
	}

	$stmt = $conn->prepare('UPDATE "article" SET abstract = ?, title = ?, content = ?, category = ? WHERE idarticle = ?');
	$stmt->execute(array($abstract, $title, $text, $category, $idarticle));
	$result = $stmt->fetch();



/*	if(isset($_POST["tags"])){
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
	}*/

	/*$articlePhoto = uploadArticlePhoto();
	if($articlePhoto !== false){
		$stmt = $stmt = $conn->prepare("INSERT INTO image (url, idarticle) VALUES (?, ?)");
		$stmt->execute(array($articlePhoto, $idarticle));
	}*/

	$link = 'Location: ../pages/read_article.php?id=' . $idarticle;
	header($link);
?>
