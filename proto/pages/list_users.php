<?php
    include_once('../config/init.php');
	include_once($BASE_DIR .'database/user.php');

	try{
		//TODO send the session id to check for permission
		$permission = isAdministrator($_SESSION["id"]);
		if(!$permission){
			throw new Exception("You don't have access to this page");
		}
		if(!($pageNo = $_GET['pageNo']))
			$pageNo = 0;

		if(!($limit = $_GET['limit']))
			$limit = 30;

		$info = accountInfo($_SESSION["id"]);
		$users = getAllUsers($pageNo, $limit);
	}catch(Exception $e){
		die($e->getMessage());
	}

	$smarty->assign('pageNo', $pageNo);
	$smarty->assign('limit', $limit);
    $smarty->assign('info', $info);
	$smarty->assign('users', $users);
	$smarty->assign('usersLength', count($users));
    $smarty->display('list_users.tpl');
?>
