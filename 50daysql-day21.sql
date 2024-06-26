-- Day 21/50 Days SQL Challenge


DROP TABLE IF EXISTS products;
-- Creating the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    quantity_sold INT
);

-- Inserting sample data for products
INSERT INTO products (product_id, product_name, price, quantity_sold) VALUES
    (1, 'iPhone', 899.00, 600),
    (2, 'iMac', 1299.00, 150),
    (3, 'MacBook Pro', 1499.00, 500),
    (4, 'AirPods', 499.00, 800),
    (5, 'Accessories', 199.00, 300);



/*
-- Question 
You have a table called products with below columns
product_id, product_name, price, qty 

Calculate the percentage contribution of each product 
to total revenue?

Round the result into 2 decimal
*/


SELECT * FROM products;

-- total revenue 
-- sales by each product 
-- sales by product/total revenue  * 100


select sum(price * quantity_sold) as total_revenue from products;


select 
		product_id,
		product_name,
		price * quantity_sold as rev_by_product,
		round(price * quantity_sold/(select sum(price * quantity_sold) as total_revenue from products) * 100,2) as per_contribution
		from products;
		
/*
-- Your Task

Find what is the contribution of MacBook Pro and iPhone
Round the result in two DECIMAL

*/