DROP INDEX IF EXISTS users;
DROP INDEX IF EXISTS report;
DROP INDEX IF EXISTS suspensions;
DROP INDEX IF EXISTS acceptedArticles;


CREATE INDEX users USING hash ON Users(name ASC);

CREATE INDEX report USING hash ON Report(category);

CREATE INDEX suspensions USING hash ON Suspension(idUser);

CREATE INDEX acceptedArticles USING hash ON Article(visibility)
    WHERE (visibility == "Visible");
