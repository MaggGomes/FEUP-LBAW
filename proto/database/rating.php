<?php

    function createRating($value, $date, $idArticle, $idUser) {
        global $conn;

        $stmt = $conn->prepare("INSERT INTO public.rating (value,date,idArticle,idUser) VALUES(?, ?, ?, ?)");
        $stmt->execute(array($value, $date, $idArticle, $idUser));
    }

    function getRatingByArticleId($id){
        global $conn;

        $stmt = $conn->prepare("SELECT COUNT(*) AS upvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = 1");

        $stmt->execute(array($id));
        $result = $stmt->fetch();

        $article['upvotes'] = $result['upvotes'];

        $stmt = $conn->prepare("SELECT COUNT(*) AS downvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = -1");

        $stmt->execute(array($id));
        $result = $stmt->fetch();

    $article['downvotes'] = $result['downvotes'];

    return $article;
}
?>