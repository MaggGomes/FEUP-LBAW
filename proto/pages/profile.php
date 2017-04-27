<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/article.php');

    $id = $_GET['id'];

    try {
        $user = getUserById($id);
    } catch (PDOException $e) {
        die($e->getMessage());
    }

    $smarty->assign('user', $user);
    $smarty->display('profile.tpl');
?>