USE sql_store;

SELECT * from customers;

SELECT *
FROM customers
-- WHERE customer_id = 1
ORDER BY first_name


SELECT first_name, last_name, points + 10 FROM customers;

# * has more precedence than +
SELECT first_name, last_name, points,
(points + 10) * 100 AS 'discount' FROM customers;

SELECT name, unit_price,
(unit_price * 1.1) AS 'new price'
 FROM sql_store.products;




 select * from customers
where points > 3000;


select * from customers
where state = 'VA';

select * from customers
where state != 'VA';

select * from customers
where birth_date > '1990-01-01';

SELECT * FROM sql_store.orders
where order_date >= '2019-01-01';

SELECT * FROM customers
where birth_date >= '2019-01-01' AND points > 1000;

SELECT * FROM customers
where birth_date >= '2019-01-01' OR
(points > 1000 AND state = 'VA');

SELECT * FROM customers
where birth_date >= '2019-01-01' OR
points > 1000;

SELECT * FROM customers
where NOT (birth_date >= '2019-01-01' OR
points > 1000);

SELECT * FROM sql_store.order_items
where order_id = 6
AND (unit_price * quantity) > 30;

 SELECT *  FROM sql_store.products
 where quantity_in_stock IN(49, 38, 72);

SELECT * FROM customers
WHERE points BETWEEN  1000 AND 3000;

SELECT * FROM customers
WHERE birth_date BETWEEN  '1990-01-01' AND '2000-01-01';

SELECT * FROM customers
WHERE last_name LIKE 'b%';

SELECT * FROM customers
WHERE last_name LIKE '%b%';

SELECT * FROM customers
WHERE last_name LIKE '%y';

SELECT * FROM customers
WHERE last_name LIKE '_____y';


SELECT * FROM customers
WHERE phone IS NULL;

SELECT * FROM customers
WHERE phone IS NOT NULL;

SELECT * FROM orders
where shipped_date IS NULL

select * from customers
order by state, first_name DESC;


SELECT * FROM sql_store.order_items
where order_id = 2
order by quantity * unit_price DESC;

SELECT *, quantity * unit_price AS total FROM sql_store.order_items
where order_id = 2
order by total DESC;

SELECT * FROM sql_store.customers
ORDER BY points DESC
LIMIT 3;

SELECT order_id, o.customer_id, first_name
FROM orders o
JOIN customers c ON
o.customer_id = c.customer_id;

SELECT order_id, o.product_id, quantity, o.unit_price
FROM order_itemss o
JOIN products p ON
o.product_id = p.product_id;



