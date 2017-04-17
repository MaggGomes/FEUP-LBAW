-- edit article
UPDATE "Article"
SET "abstract" = $abstract,
    "title" = $title,
    "content" = $content,
    "category" = $category,
    "visibility" = $visibility
WHERE "idArticle" = $idArticle;

--edit comment
UPDATE "Comment"
SET "text" = $text,
    "visibility" = $visibility
WHERE "idComment" = $idComment;

--change rating
UPDATE "Rating"
SET "value" = $value,
WHERE "id" = $id;

--edit personal info
UPDATE "Users"
SET "name" = $name,
    "email" = $email,
    "password" = $password,
    "photoURL" = $photoURL,
    "country" = $country
WHERE "id" = $id;

--change report state
UPDATE "Report"
SET "state" = $state
WHERE "id" = $id;

--change article visibility
UPDATE "Article"
SET "visibility" = $visibility
WHERE "idComment" = $idComment;

--promote user to moderator
UPDATE "Users"
SET "permission" = "Moderator"
WHERE "id" = $id;

--demote moderator to publisher
UPDATE "Users"
SET "permission" = "Publisher"
WHERE "id" = $id;

--unfollow
DELETE FROM "Follower"
WHERE "idFollowed" = $idFollowed AND
      "idFollower" = $idFollower;

--delete Comment
DELETE FROM "Comment"
WHERE "idComment" = $idComment;

--delete link tag
DELETE FROM "LinkTag"
WHERE "idTag" = $idTag AND
      "idArticle" = $idArticle;
