<?php
    include_once('../config/init.php');
	include_once($BASE_DIR .'database/user.php');

	try{
		//TODO send the session id to check for permission
		$users = getAllUsers();
	}catch(PDOException $e){
		die($e->getMessage());
	}

    $cssStyle = "../css/account.css";

    $smarty->assign('cssStyle', $cssStyle);
	$smarty->assign('users', $users);
    $smarty->display('list_users.tpl');
?>
