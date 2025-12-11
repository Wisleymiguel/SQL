-- Contagem Teste 1
SELECT COUNT(*) AS total_filmes_com_elenco
FROM (
    SELECT f.film_id
    FROM film f
    INNER JOIN film_actor fa ON f.film_id = fa.film_id
    GROUP BY f.film_id
) AS subquery;

-- Contagem Teste 2
SELECT COUNT(*) AS total_atores_prolificos
FROM (
    SELECT a.actor_id
    FROM actor a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
    HAVING COUNT(DISTINCT fa.film_id) > 25
) AS subquery;

-- Contagem Teste 3
SELECT COUNT(*) AS total_filmes_longos_elenco_grande
FROM (
    SELECT f.film_id
    FROM film f
    INNER JOIN film_actor fa ON f.film_id = fa.film_id
    WHERE f.length > 120
    GROUP BY f.film_id
    HAVING COUNT(DISTINCT fa.actor_id) >= 5
) AS subquery;

-- Contagem Teste 4
SELECT COUNT(*) AS total_categorias
FROM category;

-- Contagem Teste 5
SELECT COUNT(*) AS total_filmes_horror_acima_media
FROM (
    SELECT f.film_id
    FROM film f
    INNER JOIN film_category fc ON f.film_id = fc.film_id
    INNER JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Horror'
    AND f.length > (
        SELECT AVG(f2.length)
        FROM film f2
        INNER JOIN film_category fc2 ON f2.film_id = fc2.film_id
        INNER JOIN category c2 ON fc2.category_id = c2.category_id
        WHERE c2.name = 'Horror'
    )
) AS subquery;

-- Contagem Teste 6
SELECT COUNT(*) AS total_atores_top20
FROM (
    SELECT a.actor_id
    FROM actor a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    INNER JOIN film f ON fa.film_id = f.film_id
    GROUP BY a.actor_id
    HAVING COUNT(DISTINCT f.film_id) >= 20
    ORDER BY SUM(f.rental_rate) DESC
    LIMIT 20
) AS subquery;