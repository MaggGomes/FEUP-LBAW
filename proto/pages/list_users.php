<?php
    include_once('../config/init.php');
	include_once($BASE_DIR .'database/user.php');

	try{
		//TODO send the session id to check for permission
		$permission = isAdministrator($_SESSION["id"]);
		if(!$permission){
			throw new Exception("You don't have access to this page");
		}
		$users = getAllUsers();
	}catch(Exception $e){
		die($e->getMessage());
	}

    try{
        $info = accountInfo($_SESSION["id"]);
    }catch(Exception $err){
        die($err);
    }
    $smarty->assign('info', $info);

	  $smarty->assign('users', $users);
    $smarty->display('list_users.tpl');
?>
