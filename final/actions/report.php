<?php
	include_once("../config/init.php");

	$userID = $_SESSION["id"];
	$reportID = $_POST["repID"];
	$description = $_POST["description"];
	$reportType = $_POST["type"]

	console_log($userID);


	if ($reportType === "article") {
		$stmt = $conn->prepare("INSERT INTO report (description,state,idArticle,idUser) VALUES (?, "Pending", ?, ?)");
		$stmt->execute(array($description, $reportID, $userID));
	} elseif ($reportType === "comment") {
			$stmt = $conn->prepare("INSERT INTO report (description,state,idComment,idUser) VALUES (?, "Pending", ?, ?)");
			$stmt->execute(array($description, $reportID, $userID));
	}
	$result = $stmt->fetch();

	header("Location: ../pages/home.php");
?>
