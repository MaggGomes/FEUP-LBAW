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
                                public.article.category AS category,
                                public.image.url AS articleimage,
                                public.users.id AS userid,
                                public.users.name AS username,
                                public.users.photoURL AS userimage
                                FROM public.article
                                LEFT JOIN public.image ON (public.article.idArticle = public.image.idArticle)
                                LEFT JOIN public.users ON (public.article.idUser = public.users.id)
                                WHERE public.article.category = ? AND public.article.visibility = ?
                                ORDER BY public.article.date LIMIT 6");

        $stmt->execute(array($category, 'Visible'));
        $articles = $stmt->fetchAll();

        foreach ($articles as &$article) {

            $stmt = $conn->prepare("SELECT COUNT(*) AS upvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = 1");

            $stmt->execute(array($article['id']));
            $result = $stmt->fetch();

            $article['upvotes'] = $result['upvotes'];

            $stmt = $conn->prepare("SELECT COUNT(*) AS downvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = -1");

            $stmt->execute(array($article['id']));
            $result = $stmt->fetch();

            $article['downvotes'] = $result['downvotes'];
        }

        return $articles;
    }

    function getArticleById($id){
        global $conn;

        $stmt = $conn->prepare("SELECT public.article.idArticle AS id,
                                public.article.title AS title,
                                public.article.abstract AS abstract,
                                public.article.content AS content,
                                public.article.date AS articledate,
                                public.article.category AS category,
                                public.image.url AS articleimage,
                                public.users.id AS userid,
                                public.users.name AS username,
                                public.users.photoURL AS userimage
                                FROM public.article
                                LEFT JOIN public.image ON (public.article.idArticle = public.image.idArticle)
                                LEFT JOIN public.users ON (public.article.idUser = public.users.id)
                                WHERE public.article.idArticle = ?");

        $stmt->execute(array($id));
        $article = $stmt->fetch();

        $stmt = $conn->prepare("SELECT COUNT(*) AS upvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = 1");

        $stmt->execute(array($article['id']));
        $result = $stmt->fetch();

        $article['upvotes'] = $result['upvotes'];

        $stmt = $conn->prepare("SELECT COUNT(*) AS downvotes
                                    FROM public.rating
                                    WHERE public.rating.idArticle = ? AND public.rating.value = -1");

        $stmt->execute(array($article['id']));
        $result = $stmt->fetch();

        $article['downvotes'] = $result['downvotes'];

        return $article;
    }

    function getTopArticle(){

        global $conn;

        $stmt = $conn->prepare("SELECT public.article.idArticle AS id,
                                public.article.title AS title,
                                public.article.abstract AS abstract,
                                public.article.content AS content,
                                public.article.date AS articledate,
                                public.article.category AS category,
                                public.image.url AS articleimage,
                                public.users.id AS userid,
                                public.users.name AS username,
                                public.users.photoURL AS userimage
                                FROM public.article
                                LEFT JOIN public.image ON (public.article.idArticle = public.image.idArticle)
                                LEFT JOIN public.users ON (public.article.idUser = public.users.id)
                                WHERE public.article.idArticle = ?");

        $stmt->execute();
        return $stmt->fetchAll();
    }
?>