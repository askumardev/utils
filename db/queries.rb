========================Chinook DB Practice Queries===============
🟢 Basic Queries
Get all customers from a specific country:
SELECT FirstName, LastName, Country
FROM customers
WHERE Country = 'USA';
----------------------------------------------------
-- 1. List all customers
SELECT * FROM customers;

-- 2. Customers from India
SELECT FirstName, LastName
FROM customers
WHERE Country = 'India';

-- 3. Tracks with price > 1
SELECT Name, UnitPrice
FROM tracks
WHERE UnitPrice > 1;
----------------------------------------------------
List all tracks with their unit price:
SELECT Name, UnitPrice
FROM tracks;
----------------------------------------------------
Find all invoices above $10:
SELECT *
FROM invoices
WHERE Total > 10;
----------------------------------------------------
🟡 Intermediate Queries
Get all customers with their total spending:
SELECT c.CustomerId, c.FirstName, c.LastName, SUM(i.Total) AS TotalSpent
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId;

-- 6. Customers with their invoices
SELECT c.FirstName, i.InvoiceId, i.Total
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId;

-- 7. Track name with genre
SELECT t.Name, g.Name AS Genre
FROM tracks t
JOIN genres g ON t.GenreId = g.GenreId;

-- 10. Total spent per customer
SELECT CustomerId, SUM(Total) AS total_spent
FROM invoices
GROUP BY CustomerId;

-- 11. Count tracks per genre
SELECT g.Name, COUNT(*) AS track_count
FROM tracks t
JOIN genres g ON t.GenreId = g.GenreId
GROUP BY g.GenreId;

-- 14. Customers who spent more than $50
SELECT CustomerId, SUM(Total) AS total
FROM invoices
GROUP BY CustomerId
HAVING total > 50;

-- 15. Tracks above average price
SELECT Name, UnitPrice
FROM tracks
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM tracks);

----------------------------------------------------
Top 5 most sold tracks:
SELECT t.Name, COUNT(il.TrackId) AS SalesCount
FROM invoice_items il
JOIN tracks t ON il.TrackId = t.TrackId
GROUP BY t.TrackId
ORDER BY SalesCount DESC
LIMIT 5;

----------------------------------------------------
Find employees and how many customers they support:
SELECT e.FirstName, e.LastName, COUNT(c.CustomerId) AS CustomerCount
FROM employees e
LEFT JOIN customers c ON e.EmployeeId = c.SupportRepId
GROUP BY e.EmployeeId;

----------------------------------------------------
🔴 Advanced Queries
Find customers who spent more than average:
SELECT CustomerId, FirstName, LastName
FROM customers
WHERE CustomerId IN (
    SELECT CustomerId
    FROM invoices
    GROUP BY CustomerId
    HAVING SUM(Total) > (SELECT AVG(Total) FROM invoices)
);
----------------------------------------------------
-- 18. Top 5 customers by spending
SELECT c.FirstName, SUM(i.Total) AS total
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY total DESC
LIMIT 5;

-- 21. Rank customers by spending
SELECT CustomerId,
       SUM(Total) AS total_spent,
       RANK() OVER (ORDER BY SUM(Total) DESC) AS rank
FROM invoices
GROUP BY CustomerId;


-- 23. Monthly revenue trend
SELECT strftime('%Y-%m', InvoiceDate) AS month,
       SUM(Total) AS revenue
FROM invoices
GROUP BY month
ORDER BY month;
-- 24. Customer retention (repeat customers)
SELECT CustomerId
FROM invoices
GROUP BY CustomerId
HAVING COUNT(*) > 1;

Most popular genre:
SELECT g.Name, COUNT(*) AS PurchaseCount
FROM invoice_items il
JOIN tracks t ON il.TrackId = t.TrackId
JOIN genres g ON t.GenreId = g.GenreId
GROUP BY g.GenreId
ORDER BY PurchaseCount DESC
LIMIT 1;
----------------------------------------------------
Find the top customer per country
WITH customer_spending AS (
    SELECT c.CustomerId, c.FirstName, c.LastName, c.Country,
           SUM(i.Total) AS total_spent
    FROM customers c
    JOIN invoices i ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId
),
ranked AS (
    SELECT *,
           RANK() OVER (PARTITION BY Country ORDER BY total_spent DESC) AS rnk
    FROM customer_spending
)
SELECT CustomerId, FirstName, LastName, Country, total_spent
FROM ranked
WHERE rnk = 1;
----------------------------------------------------
Get monthly sales trend
SELECT strftime('%Y-%m', InvoiceDate) AS month,
       SUM(Total) AS monthly_sales
FROM invoices
GROUP BY month
ORDER BY month;
----------------------------------------------------
Find customers who bought Rock but not Jazz
SELECT DISTINCT c.CustomerId, c.FirstName, c.LastName
FROM customers c
WHERE c.CustomerId IN (
    -- Bought Rock
    SELECT i.CustomerId
    FROM invoices i
    JOIN invoice_items il ON i.InvoiceId = il.InvoiceId
    JOIN tracks t ON il.TrackId = t.TrackId
    JOIN genres g ON t.GenreId = g.GenreId
    WHERE g.Name = 'Rock'
)
AND c.CustomerId NOT IN (
    -- Bought Jazz
    SELECT i.CustomerId
    FROM invoices i
    JOIN invoice_items il ON i.InvoiceId = il.InvoiceId
    JOIN tracks t ON il.TrackId = t.TrackId
    JOIN genres g ON t.GenreId = g.GenreId
    WHERE g.Name = 'Jazz'
);

========================= Sakila DB Practice Queries=============================================
🟢 Basic Queries
List all actors:
SELECT first_name, last_name
FROM actor;
----------------------------------------------------
Find all movies released in a category:
SELECT f.title, c.name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Action';


-- 4. List all films
SELECT title FROM film;

-- 5. Films longer than 120 minutes
SELECT title, length
FROM film
WHERE length > 120;
----------------------------------------------------
🟡 Intermediate Queries
Find total number of rentals per customer:
SELECT c.customer_id, c.first_name, COUNT(r.rental_id) AS rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;
----------------------------------------------------
Top 5 rented movies:
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;


-- 8. Film with category
SELECT f.title, c.name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

-- 9. Customer rentals
SELECT c.first_name, r.rental_id
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id;

----------------------------------------------------
🔴 Advanced Queries
Customers who never rented a movie:
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_id IS NULL;
----------------------------------------------------
Revenue generated per store:
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM payment p
JOIN staff st ON p.staff_id = st.staff_id
JOIN store s ON st.store_id = s.store_id
GROUP BY s.store_id;
----------------------------------------------------

Find actors who acted in more than 10 films
SELECT a.actor_id, a.first_name, a.last_name,
       COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.film_id) > 10;
----------------------------------------------------
Get most profitable category
SELECT c.name AS category, SUM(p.amount) AS revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id
ORDER BY revenue DESC
LIMIT 1;
----------------------------------------------------
Find customers who rented in last 30 days but not before
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
WHERE r.rental_date >= DATE('now', '-30 days')
AND c.customer_id NOT IN (
    SELECT customer_id
    FROM rental
    WHERE rental_date < DATE('now', '-30 days')
);

-- 12. Rentals per customer
SELECT customer_id, COUNT(*) AS rentals
FROM rental
GROUP BY customer_id;

-- 13. Revenue per store
SELECT store_id, SUM(amount)
FROM payment
GROUP BY store_id;


-- 16. Actors in more than 10 films
SELECT actor_id, COUNT(*) AS film_count
FROM film_actor
GROUP BY actor_id
HAVING film_count > 10;

-- 17. Customers who rented more than average
SELECT customer_id
FROM rental
GROUP BY customer_id
HAVING COUNT(*) > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM rental
        GROUP BY customer_id
    )
);

-- 20. Top rented films
SELECT f.title, COUNT(*) AS rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id
ORDER BY rentals DESC
LIMIT 5;

-- 22. Running total revenue
SELECT payment_id,
       amount,
       SUM(amount) OVER (ORDER BY payment_date) AS running_total
FROM payment;

-- 25. Customers inactive for 30 days
SELECT customer_id
FROM customer
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM rental
    WHERE rental_date >= DATE('now', '-30 days')
);
-- 26. Most profitable category
SELECT c.name, SUM(p.amount) AS revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film_category fc ON i.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id
ORDER BY revenue DESC
LIMIT 1;
