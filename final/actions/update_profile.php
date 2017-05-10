<?php
    include_once('../config/init.php');
    include_once('../database/user.php');

    if(isset($_SESSION["id"])) {

        try {
            updateUser($_POST["name"], $_POST["email"], $_POST["country"], $_SESSION["id"]);
        } catch (PDOException $e) {
            $e->getMessage();
        }

        header('Location: ' . '../pages/account.php');
    } else {
        header('Location: ' . '../pages/home.php');
    }
?>