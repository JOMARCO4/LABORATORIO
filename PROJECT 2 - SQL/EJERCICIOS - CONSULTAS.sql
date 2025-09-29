-- DATA PROJECT: LÓGICA CONSULTAS SQL

-- 1 Crea el esquema de la BBDD.
-- esquema ha sido creado y reorganizado. Para acceder entraremos en la BBDD Chinook / Esquemas / public. Click derecho y Ver esquema. Además ha sido puesto en Bookmarks, denominado como ESQUEMA BBDD.




-- 2 Muestra los nombres de todas las películas con una clasificación por edades de ‘Rʼ.

select f.title, f.rating 
from film f 
where f.rating = 'R';




-- 3 Encuentra los nombres de los actores que tengan un “actor_idˮ entre 30 y 40.

select a.actor_id, a.first_name , a.last_name 
from actor a   
where a.actor_id between 30 and 40;




-- 4 Obtén las películas cuyo idioma coincide con el idioma original.

select f.title , f.language_id, f.original_language_id 
from film f
where f.language_id = f.original_language_id;




 -- 5 Ordena las películas por duración de forma ascendente.

select f.title,  f.length
from film f
order by f.length asc;




-- 6 Encuentra el nombre y apellido de los actores que tengan ‘Allenʼ en su apellido.

select a.first_name, a.last_name
from actor a
where a.last_name = 'ALLEN' ;




-- 7 Encuentra la cantidad total de películas en cada clasificación de la tabla “filmˮ y muestra la clasificación junto con el recuento.

SELECT 
    f.rating, 
    COUNT(*) AS total_movies
FROM film AS f
GROUP BY f.rating
ORDER BY total_movies DESC;




-- 8 Encuentra el título de todas las películas que son ‘PG13ʼ o tienen una duración mayor a 3 horas en la tabla film. ncuentra el título de todas las películas que son ‘PG-13ʼ o tienen una duración mayor a 3 horas en la tabla film.

select *
from film f
where f.rating = 'PG-13'
or f.length > 3*60;




-- 9 Encuentra la variabilidad de lo que costaría reemplazar las películas.

select variance(f.replacement_cost )
from film f;




--10 Encuentra la mayor y menor duración de una película de nuestra BBDD.

select min(f.length) as "min_length", max(f.length) as "max_length"
from film f;




-- 11 Encuentra lo que costó el antepenúltimo alquiler ordenado por día.

select p.amount
from  rental r
join payment p on r.rental_id = p.rental_id
order by r.rental_date desc
limit 1 offset 2;




-- 12 Encuentra el título de las películas en la tabla “filmˮ que no sean ni ‘NC-17ʼ ni ‘Gʼ en cuanto a su clasificación.

select f.title, f.rating
from film f
where  f.rating not in ('NC-17','G');




-- 13 Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración

SELECT 
    f.rating AS classification,
    AVG(f.length) AS avg_duration
FROM film f
GROUP BY f.rating
ORDER BY avg_duration DESC;




-- 14 Encuentra el título de todas las películas que tengan una duración mayor  a 180 minutos.

select f.title, f.length
from film f
where f.length  > 180
order by f.length desc;




-- 15 ¿Cuánto dinero ha generado en total la empresa?

select sum(amount)
from payment p;




 -- 16 Muestra los 10 clientes con mayor valor de id

select c.customer_id, c.first_name, c.last_name
from customer c
order by c.customer_id desc
limit 10;




-- 17 Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igbyʼ.

select a.first_name, a.last_name, f.title
from actor a 
join film_actor fa on a.actor_id  = fa.actor_id
join film f on fa.film_id = f.film_id
where upper(f.title) = upper('Egg Igby');




-- 18 Selecciona todos los nombres de las películas únicos.

select distinct f.title
from film f;




-- 19 Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla “filmˮ.

select f.title, f.length, c."name"
from film f
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
where f.length > 180 and c."name" = 'Comedy';




-- 20 Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos y muestra el nombre de la categoría junto con el promedio de duración.

SELECT 
    c.name AS category_name,
    AVG(f.length) AS avg_duration
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
HAVING AVG(f.length) > 110
ORDER BY avg_duration DESC;




-- 21 ¿Cuál es la media de duración del alquiler de las películas?

select AVG(r.return_date - r.rental_date) as Media_duracion_alquiler 
from rental r
where r.return_date is not null;




-- 22 Crea una columna con el nombre y apellidos de todos los actores y actrices.

select concat(first_name,' ',a.last_name) as Nombre_Actor_Completo
from actor a 
order by nombre_actor_completo asc;




-- 23 Números de alquiler por día, ordenados por cantidad de alquiler de forma descendente.

select COUNT(r.rental_id) as numero_alquileres, r.rental_date 
from rental r 
group by r.rental_date
order by numero_alquileres desc;




-- 24  Encuentra las películas con una duración superior al promedio.

select f.film_id , f.title , f.length 
from film f
where f.length >
	(select AVG(length)
	from film f2)
order by f.length desc;




-- 25  Averigua el número de alquileres registrados por mes.

select date_trunc('month', r.rental_date) as mes , count(*) as total_alquileres
from rental r 
group by date_trunc('month', r.rental_date) 
order by mes;




-- 26  Encuentra el promedio, la desviación estándar y varianza del total pagado.

SELECT AVG(amount) AS promedio, STDDEV(amount) AS desviacion_estandar, VARIANCE(amount) AS varianza
FROM payment;




-- 27  ¿Qué películas se alquilan por encima del precio medio?

select f.film_id , f.title , f.rental_rate 
from film f 
where rental_rate > 
	(select avg(rental_rate)
	from film f2)
order by rental_rate desc;




-- 28 Muestra el id de los actores que hayan participado en más de 40 películas.

select A.actor_id, concat(a.first_name,' ', a.last_name), COUNT(f.film_id)
from actor a 
join film_actor fa on a.actor_id = fa.actor_id
join film f on f.film_id = fa.film_id
group by a.actor_id 
having  COUNT(f.film_id) > 40;




-- 29  Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible.

SELECT f.film_id, f.title, COUNT(i.inventory_id) 
FILTER (WHERE inventory_in_stock(i.inventory_id)) AS cantidad_disponible
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.film_id, f.title
ORDER BY cantidad_disponible DESC;




-- 30  Obtener los actores y el número de películas en las que ha actuado.

SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS num_peliculas
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY num_peliculas DESC;




-- 31  Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.

SELECT f.film_id, f.title, a.actor_id, a.first_name, a.last_name
FROM film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
LEFT JOIN actor a ON fa.actor_id = a.actor_id
ORDER BY f.film_id, a.actor_id;




-- 32  Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.

SELECT a.actor_id, a.first_name, a.last_name, f.film_id, f.title
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
ORDER BY a.actor_id, f.film_id;




-- 33  Obtener todas las películas que tenemos y todos los registros de alquiler.

SELECT f.film_id, f.title, r.rental_id, r.rental_date, r.return_date, r.customer_id, r.inventory_id
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
ORDER BY f.film_id, r.rental_date;




-- 34  Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_gastado
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_gastado DESC
LIMIT 5;




-- 35  Selecciona todos los actores cuyo primer nombre es 'Johnny'.

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'JOHNNY';




-- 36  Renombra la columna “first_nameˮ como Nombre y “last_nameˮ como Apellido.

SELECT first_name AS "Nombre", last_name AS "Apellido"
FROM actor;




-- 37  Encuentra el ID del actor más bajo y más alto en la tabla actor.

SELECT MIN(actor_id) AS id_mas_bajo, MAX(actor_id) AS id_mas_alto
FROM actor;




-- 38  Cuenta cuántos actores hay en la tabla “actorˮ.

select COUNT(a.actor_id) as total_actores
from actor a; 




-- 39  Selecciona todos los actores y ordénalos por apellido en orden ascendente.

SELECT actor_id, first_name as nombre, last_name AS apellido
FROM actor
order by apellido asc;




-- 40  Selecciona las primeras 5 películas de la tabla “filmˮ.

select f.film_id, f.title
from film f
limit 5;




-- 41  Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. ¿Cuál es el nombre más repetido?

select a.first_name , COUNT(*) as cantidad
from actor a
group by a.first_name
order by cantidad desc;


select a.first_name , COUNT(*) as cantidad
from actor a
group by a.first_name
order by cantidad desc
limit 1;




-- 42  Encuentra todos los alquileres y los nombres de los clientes que los realizaron.

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    r.rental_id,
    r.rental_date,
    r.return_date
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
ORDER BY r.rental_id;




-- 43  Muestra todos los clientes y sus alquileres si existen, incluyendo aquellos que no tienen alquileres.

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    r.rental_id,
    r.rental_date,
    r.return_date
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
ORDER BY c.customer_id, r.rental_id;




-- 44  Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor esta consulta? ¿Por qué? Deja después de la consulta la contestación.

select *
from film f 
cross join category c; 

-- 		NOTA EXPLICATIVA: No, esta consulta no aporta ningún valor a priori ya que el CROSS JOIN genera el producto cartesiano entre todas las películas y todas las categorías. 
-- 		Es decir, cada película se empareja con todas las categorías y eso no tiene ningún sentido, además de desvirtuar la relación real que entre film y su categoria.
-- 		Para obtener una relación que tenga sentido entre películas y categorías sería mejor usar un INNER JOIN con film_category.




-- 45  Encuentra los actores que han participado en películas de la categoría 'Action'.

select f.film_id , F.title , C."name", concat(A.first_name,' ', A.last_name) as nombre_completo
from film f 
join film_actor fa on f.film_id = fa.film_id
join actor a on a.actor_id = fa.actor_id
join film_category fc on f.film_id = fc.film_id
join category c on c.category_id = fc.category_id
where c."name" = 'Action'
order by nombre_completo;




-- 46  Encuentra todos los actores que no han participado en películas.

SELECT
    CONCAT(a.first_name, ' ', a.last_name) AS full_name
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE fa.film_id IS NULL
ORDER BY full_name;




-- 47 Selecciona el nombre de los actores y la cantidad de películas en las que han participado

select a.first_name , a.last_name, COUNT(f.film_id )
from actor a 
join film_actor fa on a.actor_id = fa.actor_id
join film f on f.film_id = fa.film_id
group by a.actor_id;




-- 48  Crea una vista llamada “actor_num_peliculasˮ que muestre los nombres de los actores y el número de películas en las que han participado.

CREATE VIEW actor_num_peliculas AS
SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS num_peliculas
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY num_peliculas desc;

SELECT * FROM actor_num_peliculas;




-- 49  Calcula el número total de alquileres realizados por cada cliente.

select c.first_name , c.last_name , count(distinct r.rental_id )
from customer c
join rental r on c.customer_id  = r.customer_id
group by c.customer_id
order by 3 desc;




-- 50  Calcula la duración total de las películas en la categoría 'Action'

select sum(f.length) as total_duracion_pelis_accion
from film f 
join film_category fc  on f.film_id = fc.film_id
join category c on c.category_id = fc.category_id
where upper(c."name") = upper ('action');




-- 51  Crea una tabla temporal llamada “cliente_rentas_temporalˮ para almacenar el total de alquileres por cliente.

CREATE TEMP TABLE cliente_rentas_temporal AS

SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentas
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;




-- 52  Crea una tabla temporal llamada “peliculas_alquiladasˮ que almacene las películas que han sido alquiladas al menos 10 veces.

CREATE TEMP TABLE peliculas_alquiladas AS

SELECT f.film_id , f.title , COUNT(r.rental_id) as TOTAL_ALQUILERES 
FROM film f 
JOIN inventory i  ON i.film_id = f.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
group by f.film_id , F.title
having count(r.rental_id) >= 10
order by total_alquileres DESC;




-- 53   Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre ‘Tammy Sandersʼ y que aún no se han devuelto. Ordena los resultados alfabéticamente por título de película.

select concat(C.first_name, ' ', C.last_name) as NOMBRE_COMPLETO, F.title as no_devuelta
from customer c 
join rental r ON r.customer_id = C.customer_id
JOIN inventory i ON R.inventory_id = I.inventory_id
join film f on F.film_id = I.film_id
where c.first_name = 'TAMMY' AND c.last_name  = 'SANDERS' and R.return_date is null 
order by F.title;




-- 54 Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría ‘Sci-Fiʼ. Ordena los resultados alfabéticamente por apellido.

SELECT
    a.first_name,
    a.last_name,
    COUNT(DISTINCT f.film_id) AS film_count,
    STRING_AGG(f.title, ', ' ORDER BY f.title) AS film_titles
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON f.film_id = fa.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON c.category_id = fc.category_id
WHERE UPPER(c.name) = 'SCI-FI'
GROUP BY a.first_name, a.last_name
ORDER BY a.last_name, a.first_name;




-- 55  Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película ‘Spartacus Cheaperʼ se alquilara por primera vez. Ordena los resultados alfabéticamente por apellido.

select distinct concat(a.last_name, ' ', a.first_name) as NOMBRE_ACTOR_COMPLETO
from actor a 
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN inventory i ON fa.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE 
    r.rental_date > (
        SELECT MIN(r2.rental_date)
        FROM rental r2
        JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
        JOIN film f2 ON i2.film_id = f2.film_id
        WHERE f2.title = 'SPARTACUS CHEAPER'
    )
ORDER BY nombre_actor_completo;




-- 56  Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría ‘Musicʼ.

select concat(a.first_name, ' ', a.last_name) as NOMBRE_COMPLETO  
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on f.film_id  = fa.film_id
join film_category fc on f.film_id = fc.film_id
join category c on c.category_id = fc.category_id
where c."name" not in ('Music')
group by nombre_completo 
order by nombre_completo;




-- 57  Encuentra el título de todas las películas que fueron alquiladas por más de 8 días.

select f.title
from rental r 
join inventory i on R.inventory_id = I.inventory_id
join film f on F.film_id = I.film_id
where R.return_date is not null and R.return_date - R.rental_date > interval '8 days'
order by f.title;




-- 58  Encuentra el título de todas las películas que son de la misma categoría que ‘Animationʼ.

select f.title as titulo_pelicula, C."name" as categoria 
from film f 
join film_category fc on f.film_id = fc.film_id
join category c on c.category_id = fc.category_id
where c."name" = 'Animation';




-- 59  Encuentra los nombres de las películas que tienen la misma duración que la película con el título ‘Dancing Feverʼ. Ordena los resultados alfabéticamente por título de película.

SELECT F.title, F.length
FROM film F
WHERE 
    length = (
        SELECT length 
        FROM film F2 
        WHERE title = 'DANCING FEVER'
    )
ORDER BY F.title;




-- 60  Encuentra los nombres de los clientes que han alquilado al menos 7 películas distintas. Ordena los resultados alfabéticamente por apellido.

select C.last_name, C.first_name , COUNT(distinct i.film_id) as numero_peliculas_distintas
from customer c 
join rental r  on c.customer_id = r.customer_id
join inventory i on r.inventory_id = i.inventory_id
group by c.customer_id , C.first_name, C.last_name
having COUNT(distinct i.film_id) >= 7
order by C.last_name, c.first_name;
 



-- 61  Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.

SELECT
    c.name AS category_name,
    COUNT(r.rental_id) AS total_rentals
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY total_rentals DESC;




-- 62  Encuentra el número de películas por categoría estrenadas en 2006.

select COUNT(f.title) as titulo_pelicula, C."name" as categoria 
from film f 
join film_category fc on f.film_id = fc.film_id
join category c on c.category_id = fc.category_id
where f.release_year = 2006
group by c.name;




-- 63  Obtén todas las combinaciones posibles de trabajadores con las tiendas que tenemos.

select s.staff_id, concat(s.first_name, ' ', s.last_name) as nombre_empleado, s2.store_id
from staff s
cross join store s2 
order by s.staff_id, s2.store_id;




-- 64 Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas

select c.customer_id, c.first_name , c.last_name , count(*)
from customer c
join rental r on c.customer_id  = r.customer_id
group by c.customer_id;








