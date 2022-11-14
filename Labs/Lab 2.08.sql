
use sakila;

-- 1

select length, title, rank() over (order by length desc) as 'Rank'
from sakila.film
WHERE length IS NOT NULL;

-- 2

select length, rating, title , rank() over (order by rating, length) as 'Rank'
from sakila.film
WHERE length IS NOT NULL;

-- 3

select a.category_id, a.name, l.film_id, COUNT(film_id) AS number_of_films
from sakila.category as a
left join sakila.film_category as l on a.category_id = l.category_id
group by a.category_id;

-- 4
select a.actor_id, a.first_name, a.last_name, COUNT(film_id) AS number_of_times
from sakila.actor as a
left join sakila.film_actor as l on a.actor_id = l.actor_id
group by a.actor_id;

-- 5
select a.rental_id, l.customer_id, l.first_name, l.last_name, l.active, COUNT(rental_id) AS number_of_times
from sakila.rental as a
right join sakila.customer as l on a.customer_id = l.customer_id
WHERE l.active = 1
group by customer_id
order by number_of_times desc;

-- 6 

select a.film_id, l.rental_id, COUNT(rental_id) AS number_of_times
from sakila.inventory as a
left join sakila.rental as l on a.inventory_id = l.inventory_id
group by film_id
order by number_of_times desc;

select film_id, title
from sakila.film
where film_id = 103;
