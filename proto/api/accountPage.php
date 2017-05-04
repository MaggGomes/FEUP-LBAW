<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/user.php');

	$page = $_GET["page"];

    try {
		switch ($page) {
			case 'editProfile':
				$filename = "edit_profile.tpl";
				break;

			case 'followers':
				$followers = getFollowers($_SESSION["id"]);
				$smarty->assign('follows', $followers);
				$filename = "followers.tpl";
				break;

			case 'following':
				$following = getFollowing($_SESSION["id"]);
				$smarty->assign('follows', $following);
				$filename = "following.tpl";
				break;

			case 'articlesModerated':
				$filename = "articlesModerated.tpl";
				break;

			case 'delete':
				$filename = "delete.tpl";
				break;
				
			case 'notifications':
				$filename = "notifications.tpl";
				break;

			//check if admin
			case 'listUsers':
				$users = getAllUsers($pageNo, $limit);
				$smarty->assign('users', $users);
				$filename = "list_users.tpl";
				break;
			case 'teamManagement':
				break;
			case 'articlesPending':
				break;
			case 'articlesReported':
				break;
			case 'commentsReported':
				break;
			default:
				# code...
				break;
		}

		$output = $smarty->fetch($BASE_DIR . "templates/account/" . $filename);
    } catch (PDOException $e) {
        echo $e->getMessage();
    }

    echo $output;
?>
