DROP INDEX IF EXISTS reportIn;
DROP INDEX IF EXISTS suspensionsIn;
DROP INDEX IF EXISTS acceptedArticlesIn;
DROP INDEX IF EXISTS articleImagesIn;
DROP INDEX IF EXISTS articleDateCreation;
DROP INDEX IF EXISTS articleCategory;

CREATE INDEX reportIn ON Report USING hash(id);

CREATE INDEX suspensionsIn ON Suspension USING hash(idUser);

CREATE INDEX acceptedArticlesIn ON Article USING hash(idArticle);

CREATE INDEX articleImagesIn ON Image USING hash(idArticle);

CREATE INDEX commentDateCreation ON Comment USING btree(date ASC);

CREATE INDEX articleCategory ON Article USING btree(category);
