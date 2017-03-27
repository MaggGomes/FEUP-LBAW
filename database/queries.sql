-- ver artigos mais recentes
SELECT * FROM Article JOIN Users ON (Users.id = Article.idUser)
                       ORDER BY Article.date DESC;


-- ver artigos mais votados de sempre
SELECT * FROM Article JOIN Users ON Users.id = Article.iduser
                       JOIN Rating ON Rating.idArticle = Article.idarticle
                       GROUP BY Article.idarticle, Users.id, Rating.id
                       ORDER BY SUM(Rating.value) DESC;


-- ver artigos mais votados do dia
SELECT * FROM Article JOIN Users ON Users.id = Article.iduser
                      JOIN Rating ON Rating.idArticle = Article.idarticle
                      WHERE Rating.date = CURRENT_DATE
                      GROUP BY Article.idarticle, Users.id, Rating.id
                      ORDER BY SUM(Rating.value) DESC;


-- ver artigos mais votados da semana
SELECT * FROM Article JOIN Users ON Users.id = Article.iduser
                       JOIN Rating ON Rating.idArticle = Article.idarticle
                       WHERE Rating.date > CURRENT_DATE - 7
                       GROUP BY Article.idarticle, Users.id, Rating.id
                       ORDER BY SUM(Rating.value) DESC;

-- ver artigos reportados
SELECT * FROM Report JOIN Article ON Report.idArticle = Article.idarticle;

-- ver comentários reportados
SELECT * FROM Report JOIN Comment ON Report.idComment = Comment.idComment;


-- ver artigos de um user
SELECT * FROM Article JOIN Users ON Users.id = Article.iduser
                       WHERE Users.name = '?';

-- ver artigos de uma dada categoria
SELECT * FROM Article WHERE Category = 'Sports';
