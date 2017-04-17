-- ver artigos mais recentes
SELECT Article.title, Article.abstract, Article.date, Article.category, Users.name, Users.rating, SUM(Rating.value) FROM Article JOIN Users ON (Users.id = Article.idUser)
                                                                                                                                                  JOIN Rating ON Rating.idArticle = Article.idArticle
                                                                                                                                                  GROUP BY Article.idArticle, Users.id
                                                                                                                                                  ORDER BY Article.date DESC;
--ver tags de um artigo
SELECT Tags.tag FROM LinkTag JOIN Tags ON Tags.id = LinkTag.idTag
                             JOIN Article ON Article.idArticle = LinkTag.idArticle
                             WHERE Article.idArticle = 3;



-- ver artigos mais votados de sempre
SELECT Article.title, Article.abstract, Article.date, Article.category, Users.name, Users.rating, SUM(Rating.value) FROM Article JOIN Users ON Users.id = Article.iduser
                                                                                                                               JOIN Rating ON Rating.idArticle = Article.idarticle
                                                                                                                               GROUP BY Article.idArticle, Users.id, Rating.id
                                                                                                                               ORDER BY SUM(Rating.value) DESC;


-- ver artigos mais votados do dia
SELECT Article.title, Article.abstract, Article.date, Article.category, Users.name, Users.rating, SUM(Rating.value) FROM Article JOIN Users ON Users.id = Article.iduser
                                                                                                                                 JOIN Rating ON Rating.idArticle = Article.idArticle
                                                                                                                                 WHERE Rating.date = CURRENT_DATE
                                                                                                                                 GROUP BY Article.idArticle, Users.id, Rating.id
                                                                                                                                 ORDER BY SUM(Rating.value) DESC;


-- ver artigos mais votados da semana
SELECT Article.title, Article.abstract, Article.date, Article.category, Users.name, Users.rating, SUM(Rating.value) FROM Article JOIN Users ON Users.id = Article.iduser
                                                                                                                                 JOIN Rating ON Rating.idArticle = Article.idarticle
                                                                                                                                 WHERE Rating.date > CURRENT_DATE - 7
                                                                                                                                 GROUP BY Article.idarticle, Users.id, Rating.id
                                                                                                                                 ORDER BY SUM(Rating.value) DESC;


-- ver comentários de um artigos
SELECT Users.name, Comment.text, Comment.date FROM Comment JOIN Article ON Article.idArticle = Comment.idArticle
                                              JOIN Users on Comment.idUser = Users.id
                                              WHERE Article.idArticle = 2;


-- ver artigos reportados
SELECT Article.title, Users.name Report FROM Report JOIN Article ON Report.idArticle = Article.idarticle
                                                    JOIN Users ON Users.id = Report.idUser;

-- ver comentários reportados
SELECT Users.name FROM Report JOIN Comment ON Report.idComment = Comment.idComment
                              JOIN Users ON Users.id = Report.idUser;

-- ver artigos de um user
SELECT Article.title, Article.abstract, Article.date, Article.category, Users.name, Users.rating, SUM(Rating.value) FROM Article JOIN Users ON Users.id = Article.idUser
                                                                                                                                 JOIN Rating ON Rating.idArticle = Article.idArticle
                                                                                                                                 WHERE Users.id = 1
                                                                                                                                 GROUP BY Article.idArticle, Users.id;

-- ver artigos de uma dada categoria
SELECT Article.title, Article.abstract, Article.date, Article.category, Users.name, Users.rating, SUM(Rating.value) FROM Article JOIN Rating ON Rating.idArticle = Article.idArticle
                                                                                                                                 JOIN Users ON Users.id = Article.idUser
                                                                                                                                 WHERE Category = 'Sports'
                                                                                                                                 GROUP BY Article.idArticle, Users.id;


-- full text search - pesquisa por abstract ou content
SELECT Article.title, Article.abstract, Article.date, Article.category, Users.name, Users.rating, SUM(Rating.value) FROM Article JOIN Users ON Users.id = Article.idUser
                                                                                                                                 JOIN Rating ON Rating.idArticle = Article.idArticle
                                                                                                                                 WHERE to_tsvector(content) @@ to_tsquery('?')
                                                                                                                                 OR to_tsvector(abstract) @@ to_tsquery('?')
                                                                                                                                 OR to_tsvector(title) @@ to_tsquery('?')
                                                                                                                                 GROUP BY Article.idArticle, Users.id;
