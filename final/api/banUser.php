<?php
    include_once("../config/init.php");
    include_once("../database/user.php");

    $id = $_POST["id"];
    $endDate = $_POST["date"];
    $reason = $_POST["reason"];
    $banLevel = $_POST["banLevel"];

    if(!$reason) $reason = "No reason given";
    if(!$banLevel) $banLevel = "Hard";

    try{
        banUser($id, $endDate, $reason, $banLevel);
    }catch(PDOException $e){
        echo $e->getMessage();
    }
?>
