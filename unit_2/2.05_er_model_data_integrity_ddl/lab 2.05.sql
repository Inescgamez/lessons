-- Instructions
-- 1)Drop column picture from staff.
-- 2)A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
-- 3)Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well.
-- 4) Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

use sakila;
-- 1
alter table skila.staff drop column picture;

-- 2
-- to check if such an entry already exists
select * from skila.customer
where first_name = 'TAMMY' and last_name = 'SANDERS';

insert into skila.staff(first_name, last_name, email, address_id, store_id, username)
values('TAMMY','SANDERS', 'TAMMY.SANDERS@sakilacustomer.org', 79, 2, 'tammy');

-- 3
-- get customer_id
select customer_id from sakila.customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; 
-- expected customer_id = 130

-- get film_id
select film_id from sakila.film where title = 'ACADEMY DINOSAUR';
-- expected film_id = 1

-- get inventory_id
select inventory_id from sakila.inventory where film_id = 1;
-- expected inventory_id = 1

-- get staff_id
select * from sakila.staff;
-- expected staff_id = 1

insert into sakila.rental(rental_date, inventory_id, customer_id, staff_id)
values (curdate(), 1, 130, 1);

-- 4
-- check the current number of inactive users
select * from skila.customer
where active = 0;

drop table if exists deleted_users;

CREATE TABLE deleted_users (
customer_id int UNIQUE NOT NULL,
email varchar(255) UNIQUE NOT NULL,
delete_date date
);

insert into deleted_users
select customer_id, email, curdate()
from skila.customer
where active = 0;

select * from deleted_users;

delete from skila.customer where active = 0;

-- check how many inactive users there are now
select * from skila.customer
where active = 0;