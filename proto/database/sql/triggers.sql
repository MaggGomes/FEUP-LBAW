DROP TRIGGER IF EXISTS updateRating ON rating;
DROP TRIGGER IF EXISTS replyNotification ON comment;
DROP TRIGGER IF EXISTS articleNotification ON article;
DROP TRIGGER IF EXISTS moderationNotification ON report;

-- update user rating
CREATE OR REPLACE FUNCTION sumRating() RETURNS trigger AS $$
    DECLARE
        r users%rowtype;
    BEGIN
        FOR r IN SELECT * FROM users LOOP
            IF r.id IN (SELECT article.idUser FROM article WHERE article.idArticle = NEW.idArticle) THEN
                UPDATE users
                SET rating = rating + NEW.value
                WHERE users.id = NEW.idArticle;
            END IF;
        END LOOP;
        RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER updateRating AFTER INSERT ON rating
    FOR EACH ROW
    EXECUTE PROCEDURE sumRating();



/*
-- notificar artigos
CREATE OR REPLACE FUNCTION addArtNot() RETURNS trigger AS $$
    DECLARE
        r public.Follower%rowtype;
    BEGIN
        FOR r IN SELECT * FROM public.follower LOOP
            IF r.idFollowed = NEW.idUser THEN
                INSERT INTO Notification(date, description, read, idUser, idArticle, idComment) VALUES (CURRENT_DATE, "TEST article", false, r.idFollower, NEW.idArticle, null);
            END IF;
        END LOOP;
        RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER articleNotification AFTER INSERT ON article
    EXECUTE PROCEDURE addArtNot();*/


-- notificar resposta a comentários
CREATE OR REPLACE FUNCTION addComRepl() RETURNS trigger AS $$
    BEGIN
        IF NEW.idReply != NULL THEN
            SELECT comment.idUser AS NotUser FROM comment WHERE comment.idComment = NEW.idReply;
            INSERT INTO notification(date, description, read, idUser, idArticle, idComment) VALUES(CURRENT_DATE, "TEST reply", false, NotUser, null, NEW.idComment);
        END IF;
        RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;

CREATE TRIGGER replyNotification AFTER INSERT ON comment
    EXECUTE PROCEDURE addComRepl();



-- notificar moderação
CREATE OR REPLACE FUNCTION addRepNot() RETURNS trigger AS $$
    DECLARE
        r users%rowtype;
    BEGIN
        FOR r IN SELECT * FROM users WHERE (users.permission = 'Moderator' OR Users.permission = 'Administrator') LOOP
            INSERT INTO notification(date, description, read, idUser, idArticle, idComment) VALUES (CURRENT_DATE, "Check Moderation Page", false, r.id , null, null);
        END LOOP;
        RETURN NULL;
    END
    $$ LANGUAGE plpgsql;


CREATE TRIGGER moderationNotification AFTER INSERT ON report
    EXECUTE PROCEDURE addRepNot();
