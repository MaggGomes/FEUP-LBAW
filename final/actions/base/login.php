<?php
    include_once("../../config/init.php");
    include_once("../../database/user.php");

    header('Content-Type: application/json');

    $email = strip_tags($_POST["email"]);
    $password = $_POST["password"];
    $status = 200;
    $result = getUser($email);

    if(!$result){
        $error = "There is no account with this email";
        $status = 400;
    }

    if(!password_verify($password, $result["password"])){
        $status = 400;
    }

    if($status == 200){
        $_SESSION["email"] = $email;
        $_SESSION["username"] = $result["name"];
        $_SESSION["id"] = $result["id"];
        $_SESSION["photo"] = $result["photourl"];

        echo json_encode($status);
    } else {
        echo json_encode($status);
    }
?>
