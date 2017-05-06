<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/user.php');


    $id = $_GET['id'];

    try {
        $user = getUserByID($id);
    } catch (PDOException $e) {
        die($e->getMessage());
    }

    $smarty->assign('user', $user);
    $smarty->display('profile.tpl');
?>