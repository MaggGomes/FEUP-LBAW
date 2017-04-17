<?php

    function getAllArticles() {
        global $conn;
        $stmt = $conn->prepare("SELECT * FROM Article");
        $stmt->execute();
        return $stmt->fetchAll();
    }



?>