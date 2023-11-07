

-- INSERTING VALUES INTO TABLES

INSERT INTO products_table
           VALUES (1, 'Cookies', 10),
                  (2, 'Candy', 5.2);
				  

INSERT INTO customers_table
           VALUES (1, 'Ahmed', 'Tunisia'),
                  (2, 'Coulibaly', 'Senegal'),
                  (3, 'Hasan', 'Egypt');
				  

INSERT INTO order_table (order_id, customer_id, product_id, quantity, order_date)
VALUES (1, 1, 2, 3, '2023-01-22'),
       (2, 2, 1, 10, '2023-04-14');





SELECT * FROM products_table
SELECT * FROM customers_table
SELECT * FROM order_table




-- Update the quantity of the second order, the new value should be 6.
UPDATE order_table
SET quantity = 6
WHERE order_ID = 2;



-- Delete the third customer from the customers table.
DELETE FROM customers_table
WHERE name = 'Hasan';
     

-- Delete the orders table content then drop the table.
TRUNCATE TABLE order_table; -- deletes the order table content 

 DROP  TABLE order_table; -- drops the table 
     