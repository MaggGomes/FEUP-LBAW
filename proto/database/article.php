<?php

    function getAllArticles() {
        global $conn;
        $stmt = $conn->prepare("SELECT * FROM article");
        $stmt->execute();
        return $stmt->fetchAll();
    }



?>