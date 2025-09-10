SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

--Retrieve the total number of books sold for each genre
SELECT b.genre, SUM(o.quantity) AS total_book_sold
FROM books b
JOIN orders o ON b.book_id=o.order_id
GROUP BY b.genre;

--Find the average price of bookin the fantasy genre
SELECT AVG(price) AS Average_price_of_fantasy FROM books
WHERE genre='Fantasy';

--List customer who have placed atleast 2 orders
SELECT o.customer_id,c.name,COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON o.order_id=c.customer_id
GROUP BY o.customer_id,c.name
HAVING COUNT(order_id) >=2;

--fIND THE MOST FREQUENT ORDER BOOK
SELECT o.book_id, b.title,COUNT(o.order_id) AS order_count
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id,b.title
ORDER BY order_count DESC LIMIT 1;

--SHOW THE TOP 3 MOST EXPENSIVE BOOK
SELECT * FROM books
WHERE genre='Fantasy'
ORDER BY price DESC
LIMIT 3;

--RETRIEVE THE TOTAL QUANTITY OF BOOK SOLD BY EACH OTHER
SELECT b.author,SUM(o.quantity) AS total_book_sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.author
ORDER BY total_book_sold;

--LIST THE CITIES WHERE CUSTOMER WHO SPENT OVER 30 ARE located
SELECT DISTINCT c.city,o.total_amount
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
WHERE total_amount > 30;

--find the customer who spent the most on order
SELECT c.customer_id,c.name, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id,c.name
ORDER BY total_spent DESC
LIMIT 1;


--calculate the stock remaining after fulfilling all orders
SELECT b.book_id,b.title,b.stock, COALESCE(o.quantity,0) AS order_quantity,
					b.stock-COALESCE(o.quantity,0) AS Remaining_quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id,o.quantity ORDER BY b.book_id;
