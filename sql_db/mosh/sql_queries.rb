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
