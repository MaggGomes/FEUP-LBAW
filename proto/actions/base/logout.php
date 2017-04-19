<?php
	include_once('../../config/init.php');
	unset($_SESSION['username']);
	session_unset();
	session_destroy();
	header('Location: ../../pages/home.php');
?>
