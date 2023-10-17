--1) List all customers who live in Texas?
select first_name, last_name, district
from customer 
inner join address 
on customer.address_id = address.address_id
where district = 'Texas'

--2) Get all payments above 6.99 with the customer's full name?
select first_name, last_name, amount
from customer 
inner join payment 
on customer.customer_id = payment.customer_id
where amount > 6.99

--3) Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name
from customer
where customer_id in(
	select customer_id
	from payment 
	group by customer_id, amount
	having sum(amount)>175
	order by sum(amount) desc
);
--4) List all of the customers that live in Nepal(use the city table)
SELECT first_name,last_name,address, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal'
	
--5) Which staff members had the most transactions?
	select first_name, last_name, amount
	from staff 
	inner join payment 
	on staff.staff_id=payment.staff_id 
	group by first_name,last_name, amount
	order by sum(amount) desc
--6)How many movie of each rating are there?
	select count(rating), title
	from film 
	inner join inventory 
	on film.film_id=inventory.film_id 
	group by rating, title
	order by count(rating) desc 
--7) Show all customers who have made a single payment above $6.99?
select first_name, last_name
from customer
where customer_id in(
	select customer_id
	from payment 
	group by customer_id, amount
	having amount = 6.99
	order by amount ASC
);
--8) How many free rentals did our store give away? NONE that equal 0
select  rental_rate,store_id
from film 
inner join inventory
on film.film_id=inventory.film_id 
group by rental_rate ,store_id
order by rental_rate ASC

