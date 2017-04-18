<?php

    function getAllArticles() {
        global $conn;

        $stmt = $conn->prepare("SELECT * FROM public.article");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    function getArticlesByCategory($category) {
        global $conn;

        $stmt = $conn->prepare("SELECT public.article.idArticle AS id,
                                public.article.title AS title,
                                public.article.abstract AS abstract,
                                public.article.date AS articledate,
                                public.image.url AS imageurl
                                FROM public.article LEFT JOIN public.image ON (public.article.idArticle = public.image.idArticle)
                                WHERE public.article.category = ? AND public.article.visibility = ?
                                ORDER BY public.article.date");
        $stmt->execute(array($category, 'Visible'));
        return $stmt->fetchAll();
    }

    function getArticleById($id){
        global $conn;

        $stmt = $conn->prepare("SELECT public.article.idArticle AS id,
                                public.article.title AS title,
                                public.article.abstract AS abstract,
                                public.article.content AS content,
                                public.article.date AS articledate,
                                public.image.url AS imageurl
                                FROM public.article
                                LEFT JOIN public.image ON (public.article.idArticle = public.image.idArticle)
                                WHERE public.article.idArticle = ?");
        $stmt->execute(array($id));
        return $stmt->fetch();

    }
?>