-- CREATE BOOKS TABLE

CREATE TABLE books(
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(100),
	Genre VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10,2),
	Stock INT
);

--CREATE TABLE FOR customers

CREATE TABLE customers(
	Customer_ID SERIAL PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	Phone VARCHAR(15),
	City VARCHAR(50),
	Country VARCHAR(150)
);

-- CREATE TABLE ORDERS

CREATE TABLE orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID INT REFERENCES Customers(Customer_ID),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10,2)
);


--IMPORT DATA into BOOKS TABLE

COPY books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'D:\projects\Data Analyst\sql\Books.csv'
CSV HEADER;

--IMPORT DATA into CUSTOMERS TABLE

COPY customers(Customer_ID, Name, Email, Phone, City, Country)
FROM 'D:\projects\Data Analyst\sql\Customers.csv'
CSV HEADER;

--IMPORT DATA into ORDER TABLE

COPY orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM 'D:\projects\Data Analyst\sql\Orders.csv'
CSV HEADER;

SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM Orders;