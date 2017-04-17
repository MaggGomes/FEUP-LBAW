-- ver artigos mais recentes
SELECT article.title, article.abstract, article.date, article.category, users.name, users.rating, SUM(rating.value) FROM article JOIN users ON (users.id = article.idUser)
                                                                                                                                                  JOIN rating ON rating.idArticle = article.idArticle
                                                                                                                                                  GROUP BY article.idArticle, users.id
                                                                                                                                                  ORDER BY article.date DESC;
--ver tags de um artigo
SELECT tags.tag FROM linktag JOIN tags ON aags.id = linktag.idTag
                             JOIN article ON article.idArticle = linktag.idArticle
                             WHERE article.idArticle = 3;



-- ver artigos mais votados de sempre
SELECT article.title, article.abstract, article.date, article.category, users.name, users.rating, SUM(rating.value) FROM article JOIN users ON users.id = article.iduser
                                                                                                                               JOIN rating ON rating.idArticle = article.idArticle
                                                                                                                               GROUP BY article.idArticle, users.id, rating.id
                                                                                                                               ORDER BY SUM(rating.value) DESC;


-- ver artigos mais votados do dia
SELECT article.title, article.abstract, article.date, article.category, users.name, users.rating, SUM(rating.value) FROM article JOIN users ON users.id = article.iduser
                                                                                                                                 JOIN rating ON rating.idArticle = article.idArticle
                                                                                                                                 WHERE rating.date = CURRENT_DATE
                                                                                                                                 GROUP BY article.idArticle, users.id, rating.id
                                                                                                                                 ORDER BY SUM(rating.value) DESC;


-- ver artigos mais votados da semana
SELECT article.title, article.abstract, article.date, article.category, users.name, users.rating, SUM(rating.value) FROM article JOIN users ON users.id = article.iduser
                                                                                                                                 JOIN rating ON rating.idArticle = article.idArticle
                                                                                                                                 WHERE rating.date > CURRENT_DATE - 7
                                                                                                                                 GROUP BY article.idArticle, users.id, rating.id
                                                                                                                                 ORDER BY SUM(rating.value) DESC;


-- ver comentários de um artigos
SELECT users.name, comment.text, comment.date FROM comment JOIN article ON article.idArticle = comment.idArticle
                                              JOIN users on comment.idUser = users.id
                                              WHERE article.idArticle = 2;


-- ver artigos reportados
SELECT article.title, users.name report FROM report JOIN article ON report.idArticle = article.idArticle
                                                    JOIN users ON users.id = report.idUser;

-- ver comentários reportados
SELECT users.name FROM report JOIN comment ON report.idComment = comment.idComment
                              JOIN users ON users.id = report.idUser;

-- ver artigos de um user
SELECT article.title, article.abstract, article.date, article.category, users.name, users.rating, SUM(rating.value) FROM article JOIN users ON users.id = article.idUser
                                                                                                                                 JOIN rating ON rating.idArticle = article.idArticle
                                                                                                                                 WHERE users.id = 1
                                                                                                                                 GROUP BY article.idArticle, users.id;

-- ver artigos de uma dada categoria
SELECT article.title, article.abstract, article.date, article.category, users.name, users.rating, SUM(rating.value) FROM article JOIN rating ON rating.idArticle = article.idArticle
                                                                                                                                 JOIN users ON users.id = article.idUser
                                                                                                                                 WHERE Category = 'Sports'
                                                                                                                                 GROUP BY article.idArticle, users.id;


-- full text search - pesquisa por abstract ou content
SELECT article.title, article.abstract, article.date, article.category, users.name, users.rating, SUM(rating.value) FROM article JOIN users ON users.id = article.idUser
                                                                                                                                 JOIN rating ON rating.idArticle = article.idArticle
                                                                                                                                 WHERE to_tsvector(content) @@ to_tsquery('?')
                                                                                                                                 OR to_tsvector(abstract) @@ to_tsquery('?')
                                                                                                                                 OR to_tsvector(title) @@ to_tsquery('?')
                                                                                                                                 GROUP BY article.idArticle, users.id;
