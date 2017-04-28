<?php
    include_once('../config/init.php');
    include_once($BASE_DIR .'database/user.php');
    header('Content-Type: application/json');

    try {
        $return = follow($_SESSION["id"], $_POST['idPerson']);
    } catch (PDOException $e) {
        die($e->getMessage());
    }

    echo json_encode($return);
?>
