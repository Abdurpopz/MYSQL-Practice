create database task6;
use task6;

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories (category_name) VALUES
('Electronics'),
('Fashion'),
('Home Appliances'),
('Sports'),
('Books'),
('Furniture'),
('Toys'),
('Beauty');

INSERT INTO products (product_name, price, category_id) VALUES
-- Electronics
('Laptop', 75000, 1),
('Mobile', 45000, 1),
('Tablet', 30000, 1),
('Headphones', 8000, 1),
('Smart Watch', 20000, 1),

-- Fashion
('Jeans', 3000, 2),
('Shirt', 2000, 2),
('Jacket', 6000, 2),
('Shoes', 5000, 2),
('Watch', 7000, 2),

-- Home Appliances
('Washing Machine', 28000, 3),
('Refrigerator', 35000, 3),
('Microwave', 15000, 3),
('Mixer', 7000, 3),

-- Sports
('Cricket Bat', 4500, 4),
('Football', 2500, 4),
('Tennis Racket', 6000, 4),
('Gym Dumbbells', 8000, 4),

-- Books
('Novel', 600, 5),
('Biography', 800, 5),
('Comics', 500, 5),
('Textbook', 1200, 5),

-- Furniture
('Sofa', 40000, 6),
('Dining Table', 35000, 6),
('Chair', 7000, 6),
('Bed', 45000, 6),

-- Toys
('Toy Car', 1200, 7),
('Doll', 1500, 7),
('Puzzle', 800, 7),
('Remote Helicopter', 3500, 7),

-- Beauty
('Face Cream', 1200, 8),
('Perfume', 3500, 8),
('Makeup Kit', 5000, 8),
('Hair Dryer', 2800, 8);

SELECT 
    c.category_id,
    c.category_name,
    COUNT(p.product_id) AS total_products,
    AVG(p.price) AS average_price,
    (SELECT AVG(price) FROM products) AS overall_avg_price,
	MAX(p.price) AS top_price,
CASE  
	 WHEN AVG(p.price) > (SELECT AVG(p.price) FROM products p)
     THEN 'LUXURY'
     ELSE 'BUDGET'
END AS product_type
FROM categories c
JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_id,c.category_name
HAVING COUNT(p.product_id) >4
AND
    SUM(p.price) >
    (
        SELECT AVG(total_sales)
        FROM (
            SELECT SUM(price) AS total_sales
            FROM products
            GROUP BY category_id
        ) x
    )
;





