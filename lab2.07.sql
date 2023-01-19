-- lab 2.7

Use sakila;

-- 1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.

select * from film;

select count(f.film_id) as total_amount, fc.category_id as cat from film f
join film_category fc
on f.film_id = fc.film_id
GROUP BY fc.category_id;

-- 2 Display the total amount rung up by each staff member in August of 2005.

select * from rental;

select count(r.staff_id) as staff_name;

SELECT count(staff_id) as staff_count  FROM rental
WHERE MONTH(return_date) = 8 AND YEAR(return_date) = 2005
GROUP BY staff_id;

-- 3 Which actor has appeared in the most films?

select * from film_actor;

select count(actor_id) as actor_amo, actor_id from film_actor
GROUP BY actor_id;

-- 4 Most active customer (the customer that has rented the most number of films)

select * from customer;
select * from rental;

select count(customer_id) as amount, customer_id from rental
group by customer_id
limit 1;

-- 5 Display the first and last names, as well as the address, of each staff member.

select * from staff;

select first_name, last_name, address_id from staff;

-- 6 List each film and the number of actors who are listed for that film.

select * from film;
select * from film_actor;

select count(actor_id) as number_of_actors, f.title from film_actor fa
join film f
on fa.film_id = f.film_id
group by f.title;

-- 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select * from payment;
select * from customer;

select sum(p.amount) as total_amount, c.last_name as customer_name from payment p
join customer c
on p.customer_id = c.customer_id
group by p.customer_id
order by c.last_name asc;

-- 8 List number of films per category.

select * from film;
select * from film_category;

select count(f.film_id) as count_film, fc.category_id from film_category fc
join film f
on fc.film_id = f.film_id
group by fc.category_id;