<?php

    function getAllArticles() {
        global $conn;
        $stmt = $conn->prepare("SELECT * FROM public.article");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    function getArticlesByCategory($category) {
        global $conn;
        $stmt = $conn->prepare("SELECT * FROM public.article WHERE category = ?");
        $stmt->execute(array($category));
        return $stmt->fetchAll();
    }

// TODO - CORRIGIR FUNC
    function getArticlesByCategory1($category) {
        global $conn;
        $stmt = $conn->prepare("SELECT public.article.title AS title,
                                public.article.abstract AS abstract,
                                public.article.date AS articleDate,
                                public.image.url AS imageUrl,
                                FROM public.article JOIN public.image ON public.article.idArticle = public.image.idArticle WHERE category = ?");
        $stmt->execute(array($category));
        return $stmt->fetchAll();
    }



?>