--1. How many actors are there with the last name ‘Wahlberg’? = 2
SELECT count(*)
FROM actor
WHERE last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99? = 5,607
SELECT count(*)
FROM payment
WHERE amount >= 3.99 AND amount <= 5.99;

--3. What film does the store have the most of? (search in inventory) needs word but 4581 is answer
SELECT film_id, max(inventory_id) 
FROM inventory
GROUP BY film_id;


--4. How many customers have the last name ‘William’? 0 if typo 'Williams' =1
SELECT count(last_name)
FROM customer 
WHERE last_name = 'William';


--5. What store employee (get the id) sold the most rentals? id 2 = 7304
SELECT staff_id, count(amount) 
FROM payment
GROUP BY staff_id 
ORDER BY COUNT DESC;


--6. How many different district names are there? =378
SELECT COUNT(DISTINCT district)
FROM address;


--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, MAX(amount)
FROM film_actor 
GROUP BY film_id  
ORDER BY MAX(amount) DESC;



--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) = 30
SELECT last_name 
FROM customer
WHERE last_name like '%es%'


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
SELECT *
FROM payment 
GROUP BY customer_id >380 <430
ORDER BY amount DESC;
HAVING amount > 250;



--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total? = 5, PG-13: 223 total
SELECT rating, count(*) 
FROM film
GROUP BY rating 
ORDER BY COUNT DESC;
