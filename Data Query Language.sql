


-- Implement the provided logical model 
CREATE TABLE Customer (
	customer_id INT NOT NULL PRIMARY KEY,
	customer_name VARCHAR(255) NOT NULL,
	customer_address VARCHAR(50) NOT NULL);

CREATE TABLE Product(
product_id INT NOT NULL PRIMARY KEY,
product_name VARCHAR(255) NOT NULL,
category VARCHAR(255) NOT NULL,
price DECIMAL NOT NULL CHECK(price > 0)
);


CREATE TABLE orders (
 		order_id INT NOT NULL PRIMARY KEY,
		customer_id INT NOT NULL,
		product_id INT NOT NULL,
		quantity INT NOT NULL,
		order_date DATE NOT NULL,
		
		FOREIGN KEY (customer_id)
				   REFERENCES Customer(customer_id),

		FOREIGN KEY (product_id)
				   REFERENCES Product(product_id)
		);



--Insert data into your tables

INSERT INTO Customer
VALUES (1, 'Alice', '123 MAIN ST'),
       (2, 'Bob','456 MARKET ST'),
       (3, 'Charlie','789 ELM ST');


INSERT INTO  Product
VALUES (1, 'Clock', 'Widget', 10.00),
       (2, 'Iphone', 'Gadget', 20.00),
       (3, 'Guage', 'doohickey', 15.00);
      

INSERT INTO orders 
VALUES (1, 1, 1, 10, '2021-01-01'),
       (2, 1, 2, 5, '2021-01-02'),
       (3, 2, 1, 3, '2021-01-03'),
       (4, 2, 2, 7, '2021-01-04'),
       (5, 3, 1, 2, '2021-01-05'),
       (6, 3, 3, 3,'2021-01-06');
       


--Write a SQL query to retrieve the names of the customers who have placed an order for at least one widget and at least one gadget,
--along with the total cost of the widgets and gadgets ordered by each customer. The total cost of each item was derieved by multiplying 
--the quantity by the price of the product.

SELECT Customer.customer_name, Product.price * orders.quantity AS Total_cost
FROM Customer
JOIN orders
ON Customer.customer_id = orders.customer_id
JOIN Product
ON orders.product_id = Product.product_id
WHERE Product.category IN ('Widget', 'Gadget') AND orders.quantity >=1;



--Write a query to retrieve the names of the customers who have placed an order for at least one widget, 
--along with the total cost of the widgets ordered by each customer.

SELECT Customer.customer_name, Product.price * orders.quantity AS Total_cost
FROM Customer
JOIN orders
ON Customer.customer_id = orders.customer_id
JOIN Product
ON orders.product_id = Product.product_id
WHERE Product.category IN ('Widget') AND orders.quantity >=1;


 
--Write a query to retrieve the names of the customers who have placed an order for at least one gadget, 
--along with the total cost of the gadgets ordered by each customer.

SELECT Customer.customer_name, Product.price * orders.quantity AS Total_cost
FROM Customer
JOIN orders
ON Customer.customer_id = orders.customer_id
JOIN Product
ON orders.product_id = Product.product_id
WHERE Product.category IN ('Gadget') AND orders.quantity >=1;



--Write a query to retrieve the names of the customers who have placed an order for at least one doohickey, 
--along with the total cost of the doohickeys ordered by each customer.

SELECT Customer.customer_name, Product.price * orders.quantity AS Total_cost
FROM Customer
JOIN orders
ON Customer.customer_id = orders.customer_id
JOIN Product
ON orders.product_id = Product.product_id
WHERE Product.category IN ('Doohickey') AND orders.quantity >=1;
 


--Write a query to retrieve the total number of widgets and gadgets ordered by each customer, along with the total cost of the orders.

SELECT Product.category, orders.quantity, Product.price * orders.quantity AS Total_cost
FROM Product
JOIN orders
ON Product.product_id = orders.order_id
WHERE Product.category IN ('Widget', 'Gadget')
ORDER BY Product.category;
 


--Write a query to retrieve the names of the products that have been ordered by at least one customer, 
--along with the total quantity of each product ordered.

SELECT Product.product_name,Product.category, orders.quantity
FROM Product
JOIN orders
ON Product.product_id = orders.order_id
WHERE Product.category IN ('Widget', 'Gadget') AND orders.quantity >=1 
ORDER BY Product.product_name;

 
--Write a query to retrieve the names of the customers who have placed the most orders,
--along with the total number of orders placed by each customer.

SELECT Customer.customer_name, MAX(orders.quantity) AS total_orders
FROM Customer
JOIN orders
ON Customer.customer_id = orders.order_id
GROUP BY Customer.customer_name, orders.quantity;

 
--Write a query to retrieve the names of the products that have been ordered the most,
--along with the total quantity of each product ordered.

SELECT Product.category, Product.product_name, orders.quantity AS total_orders
FROM Product
JOIN orders
ON Product.product_id = orders.order_id
ORDER BY orders.quantity DESC


--Write a query to retrieve the names of the customers who have placed an order on every day of the week,
--along with the total number of orders placed by each customer.
SELECT Customer.customer_name, orders.order_date, orders.quantity AS total_orders
FROM Customer
JOIN orders ON Customer.customer_id = orders.order_id
WHERE orders.order_date BETWEEN '2020-12-31' AND '2021-01-07'
ORDER BY orders.quantity;

