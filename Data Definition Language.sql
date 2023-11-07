
-- Create customers_table
CREATE TABLE customers_table (
customer_id INT NOT NULL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
address VARCHAR(255) NOT NULL
);

-- Create products_table
CREATE TABLE products_table(
product_id INT NOT NULL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
price DECIMAL(10,3) NOT NULL CHECK(price > 0)
);

--Create order_table
CREATE TABLE order_table (
 		order_id INT NOT NULL,
        customer_id INT NOT NULL,
        product_id INT NOT NULL,
        quantity INT NOT NULL,
        order_date DATE NOT NULL,
FOREIGN KEY (customer_ID)
           REFERENCES customers_table(customer_id),
FOREIGN KEY (product_ID)
           REFERENCES products_table(product_id)
);
