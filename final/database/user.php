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

	function accountInfo($id){
		global $conn;

		$user = $conn->prepare("SELECT public.users.name, public.users.rating,
			public.users.photoURL,
			public.users.permission,
		    SUM(CASE WHEN public.follower.idfollower = ? THEN 1 ELSE 0 END) AS followers,
		    SUM(CASE WHEN public.follower.idfollowed = ? THEN 1 ELSE 0 END) AS following
		    FROM public.users
		    LEFT JOIN public.follower ON (public.follower.idfollower = public.users.id OR public.follower.idfollowed = public.users.id)
		    WHERE public.users.id = ?
		    GROUP BY public.users.name, public.users.rating, public.users.permission, public.users.id");
		$user->execute(array($id, $id, $id));
		return $user->fetch();
	}

	function isLogin($id){
		if($id == null){
			$_SESSION["error_messages"] = "You need an account to access this page";
			header("Location: home.php");
		}
	}
 ?>
