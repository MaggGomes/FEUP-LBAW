DROP INDEX IF EXISTS reportIn;
DROP INDEX IF EXISTS suspensionsIn;
DROP INDEX IF EXISTS acceptedArticlesIn;
DROP INDEX IF EXISTS articleImagesIn;
DROP INDEX IF EXISTS articleDateCreation;
DROP INDEX IF EXISTS articleCategory;

CREATE INDEX reportIn ON report USING hash(id);

CREATE INDEX suspensionsIn ON suspension USING hash(idUser);

CREATE INDEX acceptedArticlesIn ON article USING hash(idArticle);

CREATE INDEX articleImagesIn ON image USING hash(idArticle);

CREATE INDEX commentDateCreation ON comment USING btree(date ASC);

CREATE INDEX articleCategory ON article USING btree(category);

CREATE INDEX articleTag ON tags USING hash(tag);
