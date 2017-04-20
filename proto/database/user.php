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

	function getUser($email){
		global $conn;

		$user = $conn->prepare("SELECT * FROM public.users WHERE email = ?");
		$user->execute(array($email));
		return $user->fetch();
	}

	function isAdministrator($id){
		global $conn;

		$stmt = $conn->prepare("SELECT public.users.permission FROM public.users WHERE id = ?");
		$stmt->execute(array($id));
		$return = $stmt->fetch();
		return "Administrator" == $return["permission"];
	}
 ?>
