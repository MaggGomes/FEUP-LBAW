DROP INDEX IF EXISTS report;
DROP INDEX IF EXISTS suspensions;
DROP INDEX IF EXISTS acceptedArticles;
DROP INDEX IF EXISTS articleImages;

CREATE INDEX report USING hash ON Report(id);

CREATE INDEX suspensions USING hash ON Suspension(idUser);

CREATE INDEX acceptedArticles USING hash ON Article(idArticle)
    WHERE (visibility == "Visible");

CREATE INDEX articleImages USING hash ON Image(idArticle);
