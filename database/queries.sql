-- ver artigos mais recentes

SELECT * FROM Article JOIN Publisher ON Publisher.id = Article.publisherID
                       ORDER BY Article.date DESC;


-- ver artigos mais votados de sempre

SELECT * FROM Article JOIN Publisher ON Publisher.id = Article.publisherID
                       JOIN Rating ON Rating.idArticle = Article.id
                       ORDER BY SUM(Rating.value) DESC;


-- ver artigos mais votados do dia

SELECT * FROM Article JOIN Publisher ON Publisher.id = Article.publisherID
                       JOIN Rating ON Rating.idArticle = Article.id
                       ORDER BY SUM(Rating.value) DESC
                       WHERE Rating.date = NOW(); --TODO: alterar TODAY


-- ver artigos mais votados da semana
SELECT * FROM Article JOIN Publisher ON Publisher.id = Article.publisherID
                       JOIN Rating ON Rating.idArticle = Article.id
                       ORDER BY SUM(Rating.value) DESC
                       WHERE Rating.date BETWEEN
                             NOW()::DATE-EXTRACT(DOW FROM NOW())::INTEGER-7
                             AND NOW()::DATE-EXTRACT(DOW from NOW())::INTEGER;

-- ver artigos reportados
SELECT * FROM Report JOIN Articles ON Report.idArticle = Article.id;

-- ver comentários reportados

SELECT * FROM Report JOIN Comment ON Report.idComment = Comment.idComment;


-- ver artigos de um user
SELECT * FROM Article JOIN Publisher ON Publisher.id = Article.publisherID
                       WHERE Publisher.name = '?';

-- ver artigos de uma dada categoria
SELECT * FROM Article WHERE Category = '?';
