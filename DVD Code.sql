-- DVD Rental Analysis
-- Harvey Ijieh

-- 
-- Check for NULL values in the customer table
SELECT * FROM customer 
WHERE first_name IS NULL OR last_name IS NULL OR email IS NULL;

-- Check for NULL values in the payment table
SELECT * FROM payment 
WHERE amount IS NULL OR payment_date IS NULL;

-- Check for NULL values in the rental table
SELECT * FROM rental 
WHERE rental_date IS NULL OR inventory_id IS NULL OR customer_id IS NULL;


-- Top spending customers
SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Most profitablle cities
SELECT ct.city, SUM(p.amount) AS total_revenue
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
GROUP BY ct.city
ORDER BY total_revenue DESC
LIMIT 10;

-- Peak rental hours
SELECT EXTRACT(HOUR FROM rental_date) AS rental_hour, 
COUNT(*) AS total_rentals
FROM rental
GROUP BY rental_hour
ORDER BY rental_hour DESC;

-- Revenue trend over time
SELECT	TO_CHAR(DATE_TRUNC('Month', payment_date), 'Month') AS month,
SUM(amount) AS total_revenue
FROM payment
GROUP BY DATE_TRUNC('Month', payment_date)
ORDER BY EXTRACT(Month FROM DATE_TRUNC('Month', payment_date));

-- Tope Rental Movie Category
select name, count(r.rental_id) AS rental_count
from category c
JOIN film_category ct ON c.category_id = ct.category_id
JOIN film f ON ct.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY  rental_count DESC;

-- Revenue by category
SELECT c.name AS category, SUM(p.amount) AS total_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY total_revenue DESC;

-- Revenue by ratings
SELECT f.rating AS movie_rating, SUM(p.amount) AS total_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.rating
ORDER BY total_revenue DESC;

--Revenue by country
SELECT co.country, SUM(p.amount) AS total_revenue
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
GROUP BY co.country
ORDER BY total_revenue DESC;

