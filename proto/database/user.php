<?php
	include_once("../config/init.php");

	function getAllUsers(){
		global $conn;

		$stmt = $conn->prepare("SELECT public.users.name,
			 							public.users.email,
										public.users.photoURL,
										public.users.rating,
										public.users.permission,
										public.users.id
								FROM public.users");

		$stmt->execute();
		return $stmt->fetchAll();
	}
 ?>
