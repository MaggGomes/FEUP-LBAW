<?php
    include_once('../../config/init.php');
    include_once("../../database/user.php");

    $name = $_SERVER['displayName'];
    $email = $_SERVER['Mail'];
    $image = null;
    $password = null;

    $result = getUser($email);
    if(!$result){
        $stmt = $conn->prepare("INSERT INTO public.users (name, email, password, photourl) VALUES (?, ?, ?, ?)");
        $stmt->execute(array($name, $email, $password, $image));
        $result = $stmt->fetch();
        $result = getUser($email);
    }

    $_SESSION["email"] = $email;
    $_SESSION["id"] = $result["id"];
    $_SESSION["username"] = $name;
    $_SESSION["photo"] = $result["photourl"];

    console_log($_SESSION["email"]);
    console_log($_SESSION["username"]);

    header('Location: ../../pages/home.php');
?>