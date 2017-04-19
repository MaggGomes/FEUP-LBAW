<?php

    function createRating($value, $date, $idArticle, $idUser) {
        global $conn;

        $stmt = $conn->prepare("INSERT INTO public.rating VALUES(?, ?, ?, ?)");
        $stmt->execute(array($value, $date, $idArticle, $idUser));
    }
?>