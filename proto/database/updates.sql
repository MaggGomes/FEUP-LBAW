-- edit article
UPDATE "article"
SET "abstract" = $abstract,
    "title" = $title,
    "content" = $content,
    "category" = $category,
    "visibility" = $visibility
WHERE "idArticle" = $idArticle;

--edit comment
UPDATE "comment"
SET "text" = $text,
    "visibility" = $visibility
WHERE "idComment" = $idComment;

--change rating
UPDATE "rating"
SET "value" = $value,
WHERE "id" = $id;

--edit personal info
UPDATE "users"
SET "name" = $name,
    "email" = $email,
    "password" = $password,
    "photoURL" = $photoURL,
    "country" = $country
WHERE "id" = $id;

--change report state
UPDATE "report"
SET "state" = $state
WHERE "id" = $id;

--change article visibility
UPDATE "article"
SET "visibility" = $visibility
WHERE "idComment" = $idComment;

--promote user to moderator
UPDATE "users"
SET "permission" = "Moderator"
WHERE "id" = $id;

--demote moderator to publisher
UPDATE "users"
SET "permission" = "Publisher"
WHERE "id" = $id;

--unfollow
DELETE FROM "follower"
WHERE "idFollowed" = $idFollowed AND
      "idFollower" = $idFollower;

--delete Comment
DELETE FROM "comment"
WHERE "idComment" = $idComment;

--delete link tag
DELETE FROM "linktag"
WHERE "idTag" = $idTag AND
      "idArticle" = $idArticle;
