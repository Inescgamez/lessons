-- In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
-- Using the rental table, find out how many rentals were processed by each employee.
-- Using the film table, find out how many films were released each year.
-- Using the film table, find out for each rating how many films were there.
-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
-- Which kind of movies (rating) have a mean duration of more than two hours?

use sakila;

-- 1) 
select actor_id, last_name
from sakila.actor
where last_name <> 'Arkoyd'
-- 2) 

-- 3) 

-- 4) 

-- 5) 

-- 6) 

-- 7) 