-- Lista completa de filmes com todas as informações e elenco concatenado
SELECT
    f.film_id AS FID,
    f.title AS titulo,
    f.description AS descricao,
    c.name AS categoria,
    f.rental_rate AS preco,
    f.length AS duracao,
    f.rating AS classificacao,
    GROUP_CONCAT(
        CONCAT(a.first_name, ' ', a.last_name)
        ORDER BY a.last_name
        SEPARATOR ', '
    ) AS atores
FROM
    film f
INNER JOIN film_category fc 
    ON f.film_id = fc.film_id
INNER JOIN category c 
    ON fc.category_id = c.category_id
INNER JOIN film_actor fa 
    ON f.film_id = fa.film_id
INNER JOIN actor a 
    ON fa.actor_id = a.actor_id
GROUP BY
    f.film_id,
    f.title,
    f.description,
    c.name,
    f.rental_rate,
    f.length,
    f.rating
ORDER BY
    f.title;


    -- Atores com mais de 25 filmes e as categorias em que mais atuaram
SELECT
    a.actor_id AS AID,
    CONCAT(a.first_name, ' ', a.last_name) AS ator,
    COUNT(DISTINCT f.film_id) AS total_filmes,
    COUNT(DISTINCT c.category_id) AS total_categorias,
    GROUP_CONCAT(
        DISTINCT c.name
        ORDER BY c.name
        SEPARATOR ', '
    ) AS categorias,
    ROUND(AVG(f.length), 2) AS duracao_media
FROM
    actor a
INNER JOIN film_actor fa 
    ON a.actor_id = fa.actor_id
INNER JOIN film f 
    ON fa.film_id = f.film_id
INNER JOIN film_category fc 
    ON f.film_id = fc.film_id
INNER JOIN category c 
    ON fc.category_id = c.category_id
GROUP BY
    a.actor_id,
    a.first_name,
    a.last_name
HAVING
    COUNT(DISTINCT f.film_id) > 25
ORDER BY
    total_filmes DESC,
    ator;

    -- Filmes de Horror com duração acima da média, mostrando elenco e detalhes
SELECT
    f.film_id AS FID,
    f.title AS titulo,
    f.length AS duracao,
    f.rating AS classificacao,
    f.rental_rate AS preco,
    COUNT(fa.actor_id) AS num_atores,
    GROUP_CONCAT(
        CONCAT(a.first_name, ' ', a.last_name)
        ORDER BY a.last_name
        SEPARATOR ', '
    ) AS elenco
FROM
    film f
INNER JOIN film_category fc 
    ON f.film_id = fc.film_id
INNER JOIN category c 
    ON fc.category_id = c.category_id
INNER JOIN film_actor fa 
    ON f.film_id = fa.film_id
INNER JOIN actor a 
    ON fa.actor_id = a.actor_id
WHERE
    c.name = 'Horror'
    AND f.length > (
        SELECT AVG(f2.length)
        FROM film f2
        INNER JOIN film_category fc2 ON f2.film_id = fc2.film_id
        INNER JOIN category c2 ON fc2.category_id = c2.category_id
        WHERE c2.name = 'Horror'
    )
GROUP BY
    f.film_id,
    f.title,
    f.length,
    f.rating,
    f.rental_rate
ORDER BY
    f.length DESC,
    num_atores DESC;