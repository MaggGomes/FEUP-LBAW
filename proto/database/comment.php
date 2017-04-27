<?php
    function getArticleComments($id) {
        global $conn;

        $stmt = $conn->prepare("SELECT * FROM comment JOIN users ON (users.id = comment.idUser) WHERE comment.idArticle = ?");
        $stmt->execute(array($id));

        $comments = $stmt->fetchAll();

        for ($i = 0; $i < count($comments); $i++)
        {
            $stmt = $conn->prepare("SELECT COUNT(value) AS upvotes FROM rating WHERE rating.idComment = ? AND value = 1");
            $stmt->execute(array($comment['idComment']));
            $comments[$i]['upvotes'] = $stmt->fetch()['upvotes'];

            $stmt = $conn->prepare("SELECT COUNT(value) AS downvotes FROM rating WHERE rating.idComment = ? AND value = -1");
            $stmt->execute(array($comment['idComment']));
            $comments[$i]['downvotes'] = $stmt->fetch()['downvotes'];
        }
        console_log($comments);
        return $comments;
    }

?>
