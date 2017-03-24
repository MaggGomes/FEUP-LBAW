CREATE TRIGGER updateRating AFTER INSERT ON Rating
    BEGIN
        UPDATE Publisher
        SET Publisher.rating = Publisher.rating + NEW.value
        WHERE (Rating.idArticle NOT NULL);
    END;
