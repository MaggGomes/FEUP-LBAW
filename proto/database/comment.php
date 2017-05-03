<?php
    function getArticleComments($id) {
        global $conn;

        $stmt = $conn->prepare("SELECT comment.*,
			users.id AS userid
			users.name AS username
			users.photourl AS userimage
			SUM(CASE WHEN rating.value = 1 THEN 1 ELSE 0 END) AS upvotes,
			SUM(CASE WHEN rating.value = -1 THEN 1 ELSE 0 END) AS downvotes,
			FROM comment
			LEFT JOIN users ON (users.id = comment.idUser)
			LEFT JOIN rating ON (rating.idComment = comment.id)
			WHERE comment.idArticle = ?");
        $stmt->execute(array($id));

        $comments = $stmt->fetchAll();

        for ($i = 0; $i < count($comments); $i++)
        {
            $comments[$i]['replies'] = getCommentReplies($comments[$i]['id']);
        }
        console_log($comments);
        return $comments;
    }

	function getCommentReplies($id){
		global $conn;

        $stmt = $conn->prepare("SELECT comment.*,
			users.id AS userid
			users.name AS username
			users.photourl AS userimage
			SUM(CASE WHEN rating.value = 1 THEN 1 ELSE 0 END) AS upvotes,
			SUM(CASE WHEN rating.value = -1 THEN 1 ELSE 0 END) AS downvotes,
			FROM comment
			LEFT JOIN users ON (users.id = comment.idUser)
			LEFT JOIN rating ON (rating.idComment = comment.id)
			WHERE comment.idReply = ?");
        $stmt->execute(array($id));

        $comments = $stmt->fetchAll();
		return $comments;
	}

?>
