create database testcase2;
use testcase2;

CREATE TABLE customers (
    customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL
);

INSERT INTO customers (customer_name) VALUES
('Abdur'),
('Aaleeyaah'),
('Anuu'),
('Virat'),
('Hardik');

CREATE TABLE categories (
    category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
)auto_increment=101;

INSERT INTO categories (category_name) VALUES
('Electronics'),
('Home Appliances'),
('Sports'),
('Fashion'),
('Accessories');


CREATE TABLE products (
    product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
)auto_increment=1001;

INSERT INTO products (product_name) VALUES
('Laptop'),
('Mouse'),
('Keyboard'),
('Refrigerator'),
('Football'),
('Headphones'),
('T-Shirt');


CREATE TABLE orders (
    order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    category_id INT NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO orders (customer_id, category_id, product_id) VALUES
(1, 101, 1001),  -- Laptop (Electronics)
(2, 101, 1002),  -- Mouse (Electronics)
(3, 102, 1004),  -- Refrigerator (Home Appliances)
(4, 103, 1005),  -- Football (Sports)
(5, 101, 1001);  -- Laptop (Electronics)


SELECT 
    p.product_id,
    p.product_name,
    c.category_name
FROM products p
JOIN categories c ON c.category_id = p.product_id + 100   -- (see note below)
WHERE p.product_id NOT IN (
    SELECT o.product_id
    FROM orders o
)
AND c.category_name <> 'Accessories';


