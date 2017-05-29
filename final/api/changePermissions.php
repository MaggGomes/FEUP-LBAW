<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/user.php');

    header('Content-Type: application/json');
    if(!isAdministrator($_SESSION["id"])){
        echo "Not Admin";
    } else{
        try {
            $return = changeStatus($_POST["id"], $_POST["permission"]);
        } catch (PDOException $e) {
            die($e->getMessage());
        }

        echo "Changed permissions successfully";
    }
?>
