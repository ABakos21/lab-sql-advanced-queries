#List each pair of actors that have worked together.

SELECT
	CONCAT(actor1.first_name, ' ', actor1.last_name) AS "Actor 1", 
    CONCAT(actor2.first_name, ' ', actor2.last_name) AS "Actor 2" 
	FROM 
		film_actor AS table1
JOIN 
	film_actor AS table2 
	ON 
		table1.film_id = table2.film_id
	AND 
		table1.actor_id > table2.actor_id
JOIN 
	actor AS actor1 
	ON 
		table1.actor_id = actor1.actor_id
JOIN 
	actor AS actor2 
	ON 	
		table2.actor_id = actor2.actor_id
ORDER BY 
	actor1.last_name;





#For each film, list actor that has acted in more films.

SELECT
	a.actor_id,
	CONCAT(a.first_name, ' ', a.last_name) AS "Actor", 
	COUNT(fa.film_id) as num_films
FROM
	film_actor fa
JOIN
	actor a
USING
	(actor_id)
GROUP BY
	actor_id
ORDER BY
	num_films DESC;

SELECT
	f.title,
    CONCAT(a.first_name, ' ', a.last_name) AS "Actor", 
	COUNT(fa.film_id) as num_films
FROM
	film_actor fa
JOIN
	actor a
USING
	(actor_id)
JOIN
	film f
USING 
	(film_id)
WHERE film_id IN (SELECT
	COUNT(fa.film_id) as num_films
FROM
	film_actor fa
JOIN
	actor a
USING
	(actor_id)
GROUP BY
	actor_id
ORDER BY
	num_films DESC)
GROUP BY
	f.title;






		