========================Chinook DB Practice Queries===============
🟢 Basic Queries
Get all customers from a specific country:
SELECT FirstName, LastName, Country
FROM customers
WHERE Country = 'USA';
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
