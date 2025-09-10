SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

-- Retrieve all book in the "fiction" genre
SELECT * FROM books
WHERE genre='Fiction';

--find books published after the year 1950
SELECT * FROM books
WHERE published_year>1950;

--List all customer from canada
SELECT * FROM customers
WHERE Country='Canada';

--show order placed in november 2023
SELECT * FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

--RETRIEVE THE TOTAL STOCKNOF BOOK AVAILABLE
SELECT SUM(stock) AS total_stock FROM books;

--Find the details of most expensive books
SELECT * FROM books
ORDER BY price DESC
LIMIT 1;

--show all customer who order more than 1 quantity of a books
SELECT * FROM orders
WHERE quantity>1;

--retrieve all order where the total amount exceeds 250
SELECT * FROM orders
WHERE total_amount>250;

--List all genre available in the books
SELECT DISTINCT genre FROM books;

--Find the book with the lowest stock
SELECT * FROM books
ORDER BY price
LIMIT 1;

--CALCULATE THE TOTAL REVENUE  GENERATED FROM ALL THE ORDERS
SELECT SUM(total_amount) AS total_revenue FROM orders;