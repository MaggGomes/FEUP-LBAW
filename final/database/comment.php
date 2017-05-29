<?php

function getArticleComments($id) {
    global $conn;

    $stmt = $conn->prepare("SELECT comment.*,
            date_part('day', comment.date) AS commentday,
            to_char(comment.date, 'Month') AS commentmonth,
            date_part('year', comment.date) AS commentyear,
			users.id AS userid,
			users.name AS username,
			users.photourl AS userimage,
			rating.value AS rating
			FROM comment
			LEFT JOIN users ON (users.id = comment.idUser)
			LEFT JOIN public.rating ON (comment.idComment = public.rating.idComment AND public.rating.idUser = ?)
			WHERE comment.idArticle = ? AND comment.idreply IS NULL
            GROUP BY comment.idComment, users.id, rating.value
            ORDER BY comment.date DESC");

    $stmt->execute(array($_SESSION['id'], $id));
    $comments = $stmt->fetchAll();


    for ($i = 0; $i < count($comments); $i++){
        $stmt = $conn->prepare("SELECT COUNT(*) AS upvotes
                                    FROM public.rating
                                    WHERE public.rating.idComment= ? AND public.rating.value = 1");

        $stmt->execute(array($comments[$i]['idcomment']));
        $result = $stmt->fetch();

        $comments[$i]['upvotes'] = $result['upvotes'];

        $stmt = $conn->prepare("SELECT COUNT(*) AS downvotes
                                    FROM public.rating
                                    WHERE public.rating.idComment = ? AND public.rating.value = -1");

        $stmt->execute(array($comments[$i]['idcomment']));
        $result = $stmt->fetch();

        $comments[$i]['downvotes'] = $result['downvotes'];

        $comments[$i]['replies'] = getCommentReplies($comments[$i]['idcomment']);
    }

    return $comments;
}

function getCommentReplies($id){
    global $conn;

    $stmt = $conn->prepare("SELECT comment.*,
            date_part('day', comment.date) AS commentday,
            to_char(comment.date, 'Month') AS commentmonth,
            date_part('year', comment.date) AS commentyear,
			users.id AS userid,
			users.name AS username,
			users.photourl AS userimage,
			SUM(CASE WHEN rating.value = 1 THEN 1 ELSE 0 END) AS upvotes,
			SUM(CASE WHEN rating.value = -1 THEN 1 ELSE 0 END) AS downvotes
			FROM comment
			LEFT JOIN users ON (users.id = comment.idUser)
			LEFT JOIN rating ON (rating.idComment = comment.idComment)
			WHERE comment.idReply = ?
            GROUP BY comment.idComment, users.id");

    $stmt->execute(array($id));
    $comments = $stmt->fetchAll();

    return $comments;
}

function getNumberComments($id){
    global $conn;

    $stmt = $conn->prepare("SELECT COUNT(*) AS numbercomments
			FROM comment
			WHERE comment.idArticle = ? ");

    $stmt->execute(array($id));
    $comments = $stmt->fetch();

    return $comments['numbercomments'];
}

function getReportedComments($offset){
    global $conn;

    $stmt = $conn->prepare("SELECT comment.idarticle AS idarticle,
                                       comment.text AS comment,
                                       users.photourl AS userimage,
                                       users.name AS user,
                                       users.id AS userid,
                                       report.description AS report
                                       FROM report JOIN comment ON report.idcomment = comment.idcomment
                                                   JOIN users ON users.id = report.idUser LIMIT 8");

    $stmt->execute();
    $comments = $stmt->fetchAll();

    return $comments;
}
?>
