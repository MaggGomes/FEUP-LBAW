<?php
	function getAllUsers($name, $minRating, $limit, $offset, $orderChoice){
		global $conn;


        //$limits = " LIMIT " + $limit +
            //"OFFSET " + $offset;
        $limits = " OFFSET ? LIMIT ? ";
        $params = moreParameters($name, $minRating);
        $order = ordering($orderChoice);
        $statement = "SELECT public.users.name,
			public.users.email,
			public.users.photoURL,
			public.users.rating,
			public.users.permission,
			public.users.id FROM public.users";
        //$statement += pageLimits();
        if($params) $statement = $statement . " WHERE " . $params;
        $statement = $statement . $order;
        $statement = $statement . $limits;
		$stmt = $conn->prepare($statement);

		$stmt->execute(array(($offset-1)*$limit, $limit));

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

		$user = $conn->prepare("SELECT public.users.name, public.users.email, public.users.country,
			public.users.rating, public.users.permission, public.users.photourl, public.users.id,
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

	function getFollowing($id, $name, $minRating, $limit, $offset, $orderChoice){
		global $conn;
        $limits = " OFFSET ? LIMIT ? ";
        $params = moreParameters($name, $minRating);
        $order = ordering($orderChoice);
        $statement = "SELECT public.users.name, public.users.photoURL, public.follower.idFollowed
			FROM public.users
			JOIN public.follower ON (public.users.id = public.follower.idFollowed)
			WHERE public.follower.idFollower = ?";
        $statement = $statement . " AND " + $params;
        $statement = $statement . $order;
        $statement = $statement . $limits;
		$stmt = $conn->prepare($statement);
		$stmt->execute(array($id, ($offset-1)*$limit, $limit));
		return $stmt->fetchAll();
	}

	function getFollowers($id, $name, $minRating, $limit, $offset, $orderChoice){
		global $conn;
        $limits = " OFFSET ? LIMIT ? ";
        $params = moreParameters($name, $minRating);
        $order = ordering($orderChoice);
        $statement = "SELECT public.users.name, public.users.photoURL, public.follower.idFollowed
    		FROM public.users
    		JOIN public.follower ON (public.users.id = public.follower.idFollower)
    		WHERE public.follower.idFollowed = ?";
            $statement = $statement . " AND " + $params;
            $statement = $statement . $order;
            $statement = $statement . $limits;
		$stmt->execute(array($id, ($offset-1)*$limit, $limit));
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

	function updateUser($name, $email, $country, $id){
		global $conn;

		if($_FILES['profilePicture']['size'] > 0){
			if(uploadProfilePicture()){
				console_log($_FILES['profilePicture']['name']);
				$stmt = $conn->prepare('UPDATE users SET
										photourl = ? WHERE id = ?');
				$stmt->execute(array($_FILES['profilePicture']['name'], $id));
			}
		}


		$stmt = $conn->prepare('UPDATE public.users SET
								name = ?,
								email = ?,
								country = ? WHERE id = ?');
		$stmt->execute(array($name, $email, $country, $id));
	}

	function uploadProfilePicture(){
		$target = '../upload/user_profile/' . $_FILES['profilePicture']['name'];

		if(strpos(mime_content_type($_FILES['profilePicture']['tmp_name']), 'image') === false){
			echo "File uploaded is not an image";
			return false;
		}

		if ($_FILES['profilePicture']['size'] > 500000) {
            echo 'Sorry, your file is too large.';
			return false;
        }

		if(file_exists($target)){
			echo "File already exists";
			return false;
		}

		if(!move_uploaded_file($_FILES['profilePicture']['tmp_name'], $target)){
			echo "There was an error uploading your file, please try again";
			return false;
		}

		return true;
	}

	//TODO needs testing
	function banUser($id, $end, $reason, $banLevel){
		global $conn;

		$stmt = $conn->prepare("INSERT INTO public.suspension (start, terminate, reason, ban, idUser) VALUES(LOCALTIMESTAMP, ?, ?, ?, ?)");
        $stmt->execute($end, $reason, $banLevel, $id);
    }

	//TODO needs testing
	function changeStatus($id, $newStatus){
		global $conn;

		$stmt = $conn->prepare("UPDATE users SET users.permission = ? WHERE users.id = ?");
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
			WHERE users.id = ?");
        $stmt->execute($id);
    }

	function getAccountPage($id){
		global $smarty;
		global $BASE_DIR;

		$user = accountInfo($id);
		$smarty->assign('user', $user);
		$output = $smarty->fetch($BASE_DIR . "templates/common/a.tpl");
		return $output;
	}

	function ownModerated($id){
		global $conn;

		$stmt = $conn->prepare("SELECT public.article.idArticle AS id,
			public.article.title AS title,
			public.article.abstract AS abstract,
			public.article.content AS content,
			public.article.date AS articledate,
			public.article.category AS category,
			public.image.url AS articleimage
			FROM public.article
			JOIN public.users ON (public.article.idUser = public.users.id)
			LEFT JOIN public.image ON (public.article.idArticle = public.image.idArticle)
			WHERE public.article.visibility = 'Moderated'
			AND public.users.id = ?");

		$stmt->execute(array($id));
		return $stmt->fetchAll();

	}

	function getStaff(){
		global $conn;

		$stmt = $conn->prepare("SELECT public.users.name,
										public.users.email,
										public.users.photoURL,
										public.users.rating,
										public.users.permission,
										public.users.id
								FROM public.users
								WHERE users.permission = 'Moderator' OR users.permission = 'Administrator'
								ORDER BY public.users.name ASC
								OFFSET ?
								LIMIT ?");

		$stmt->execute(array($pageNo*$limit, $limit));

		return $stmt->fetchAll();
	}

    function moreParameters($name, $minRating){
        $stmt = "";
        if($name && $name !== "")
            $stmt = $stmt . " users.name LIKE  '%".$name."%'";
        if($minRating){
            if($stmt !== "")
                $stmt = $stmt ." AND ";
            $stmt = $stmt . " users.rating > " . $minRating;
        }
        return $stmt;
    }

    function ordering($order){
        $st = " ORDER BY ";
        $i;
        switch ($order) {
            case 1:
                $i = "users.name ASC";
                break;
            case 2:
                $i = "users.name DESC";
                break;
            case 3:
                $i = "users.rating DESC";
                break;
            case 4:
                $i = "users.rating ASC";
                break;
            default:
                $i = "users.name ASC";
                break;
        }
        return $st . $i;
    }
?>
