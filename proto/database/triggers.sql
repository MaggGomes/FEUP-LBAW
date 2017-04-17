DROP TRIGGER IF EXISTS updateRating ON Rating;
DROP TRIGGER IF EXISTS replyNotification ON Comment;
DROP TRIGGER IF EXISTS articleNotification ON Article;
DROP TRIGGER IF EXISTS moderationNotification ON Report;

-- update user rating
CREATE OR REPLACE FUNCTION sumRating() RETURNS trigger AS $$
    DECLARE
        r Users%rowtype;
    BEGIN
        FOR r IN SELECT * FROM Users LOOP
            IF r.id IN (SELECT Article.idUser FROM Article WHERE Article.idArticle = NEW.idArticle) THEN
                UPDATE Users
                SET rating = rating + NEW.value
                WHERE Users.id = NEW.idArticle;
            END IF;
        END LOOP;
        RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER updateRating AFTER INSERT ON Rating
    FOR EACH ROW
    EXECUTE PROCEDURE sumRating();




-- notificar artigos
CREATE OR REPLACE FUNCTION addArtNot() RETURNS trigger AS $$
    DECLARE
        r Follower%rowtype;
    BEGIN
        FOR r IN SELECT * FROM Follower LOOP
            IF r.idFollowed = NEW.idUser THEN
                INSERT INTO Notification(date, description, read, idUser, idArticle, idComment) VALUES (CURRENT_DATE, "TEST Article", false, r.idFollower, NEW.idArticle, null);
            END IF;
        END LOOP;
        RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER articleNotification AFTER INSERT ON Article
    EXECUTE PROCEDURE addArtNot();


-- notificar resposta a comentários
CREATE OR REPLACE FUNCTION addComRepl() RETURNS trigger AS $$
    BEGIN
        IF NEW.idReply != NULL THEN
            SELECT Comment.idUser AS NotUser FROM Comment WHERE Comment.idComment = NEW.idReply;
            INSERT INTO Notification(date, description, read, idUser, idArticle, idComment) VALUES(CURRENT_DATE, "TEST Reply", false, NotUser, null, NEW.idComment);
        END IF;
        RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER replyNotification AFTER INSERT ON Comment
    EXECUTE PROCEDURE addComRepl();



-- notificar moderação
CREATE OR REPLACE FUNCTION addRepNot() RETURNS trigger AS $$
    DECLARE
        r Users%rowtype;
    BEGIN
        FOR r IN SELECT * FROM Users WHERE (Users.permission = 'Moderator' OR Users.permission = 'Administrator') LOOP
            INSERT INTO Notification(date, description, read, idUser, idArticle, idComment) VALUES (CURRENT_DATE, "Check Moderation Page", false, r.id , null, null);
        END LOOP;
        RETURN NULL;
    END
    $$ LANGUAGE plpgsql;


CREATE TRIGGER moderationNotification AFTER INSERT ON Report
    EXECUTE PROCEDURE addRepNot();
