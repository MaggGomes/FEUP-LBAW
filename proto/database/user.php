<?php
	include_once("../config/init.php");

	function getAllUsers($pageNo, $limit){
		global $conn;

		$stmt = $conn->prepare("SELECT public.users.name,
			 							public.users.email,
										public.users.photoURL,
										public.users.rating,
										public.users.permission,
										public.users.id
								FROM public.users
								ORDER BY public.users.name ASC
								OFFSET ?
								LIMIT ?");

		$stmt->execute(array($pageNo*$limit, $limit));
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
			public.users.permission, public.users.photourl, public.users.id,
			SUM(CASE WHEN public.follower.idfollowed = public.users.id AND public.follower.idfollower = ?  THEN 1 ELSE 0 END) AS profileFollow,
		    SUM(CASE WHEN public.follower.idfollower = public.users.id THEN 1 ELSE 0 END) AS following,
		    SUM(CASE WHEN public.follower.idfollowed = public.users.id THEN 1 ELSE 0 END) AS followers
		    FROM public.users
		    LEFT JOIN public.follower ON (public.follower.idfollower = public.users.id OR public.follower.idfollowed = public.users.id)
		    WHERE public.users.id = ?
		    GROUP BY public.users.name, public.users.rating, public.users.permission, public.users.id");
		$user->execute(array($_SESSION["id"], $id));
		return $user->fetch();
	}

	function isLogin($id){
		if($id == null){
			$_SESSION["error_messages"] = "You need an account to access this page";
			header("Location: home.php");
		}
	}

	function getFollowing($id){
		global $conn;

		$stmt = $conn->prepare("SELECT public.users.name, public.follower.idFollowed
								FROM public.users
								JOIN public.follower ON (public.users.id = public.follower.idFollowed)
								WHERE public.follower.idFollower = ?");
		$stmt->execute(array($id));
		return $stmt->fetchAll();
	}

	function getFollowers($id){
		global $conn;

		$stmt = $conn->prepare("SELECT public.users.name, public.follower.idFollowed
								FROM public.users
								JOIN public.follower ON (public.users.id = public.follower.idFollower)
								WHERE public.follower.idFollowed = ?");
		$stmt->execute(array($id));
		return $stmt->fetchAll();
	}

	function follow($ownId, $secondId){
		global $conn;
		if(isFollowing($ownId, $secondId)){
			$stmt = $conn->prepare("DELETE FROM public.follower WHERE public.follower.idFollower = ? AND public.follower.idFollowed = ?");
			$stmt->execute(array($ownId, $secondId));
			return 0;
		}else{
			$stmt = $conn->prepare("INSERT INTO public.follower (idFollower, idFollowed) VALUES(?, ?)");
			$stmt->execute(array($ownId, $secondId));
			return 1;
		}
	}

	function isFollowing($id, $secondId){
		global $conn;
		$stmt = $conn->prepare("SELECT * FROM public.follower WHERE public.follower.idFollower = ? AND public.follower.idFollowed = ?");
		$stmt->execute(array($id, $secondId));
		return $stmt->fetch();
	}

    //TODO needs testing
    function banUser($id, $end, $reason, $banLevel){
        global $conn;
        $stmt = $conn->prepare("INSERT INTO public.suspension (start, terminate, reason, ban, idUser) VALUES(LOCALTIMESTAMP, ?, ?, ?, ?)")
        $stmt->execute($end, $reason, $banLevel, $idUser);
    }

    //TODO needs testing
    function changeStatus($id, $newStatus){
        global $conn;
        $stmt = $conn->prepare("UPDATE users SET users.permission = ? WHERE users.id = ?")
        $stmt->execute($newStatus, $id);
    }

	//TODO needs testing
	function userStatistics($id){
        global $conn;
        $stmt = $conn->prepare("SELECT
			SUM(CASE WHEN rating.idUser = ? AND rating.value = 1 THEN 1 ELSE 0) AS upvotes
			SUM(CASE WHEN rating.idUser = ? AND rating.value = -1 THEN 1 ELSE 0) AS downvotes
			SUM(CASE WHEN report.idUser = ? AND report.state = 'Accepted' THEN 1 ELSE 0) AS acceptedReports
			SUM(CASE WHEN article.idUser = ? THEN 1 ELSE 0) AS articlesWritten
			SUM(CASE WHEN suspension.idUser = ? THEN 1 ELSE 0) AS suspensions
			SUM(CASE WHEN report.idArticle = ? AND article.idUser = ? THEN 1 ELSE 0) AS ownReported
			FROM users
			LEFT JOIN rating ON (rating.idUser = users.id)
			LEFT JOIN report ON (report.idUser = users.id)
			LEFT JOIN article ON (article.idUser = users.id)
			LEFT JOIN suspension ON (suspension.idUser = users.id)
			WHERE users.id = ?")
        $stmt->execute($id);
    }
 ?>
