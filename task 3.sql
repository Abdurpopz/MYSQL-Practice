create database task3;
use task3;

CREATE TABLE products (
product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(255) NOT NULL,
price BIGINT(10) NOT NULL,
supplier_name VARCHAR(255) NOT  NULL
);

INSERT INTO products (product_name, price, supplier_name) VALUES
('Wireless Mouse', 450, 'TechSuppliers Ltd'),
('Bluetooth Keyboard', 780, 'GadgetWorld'),
('USB-C Charger', 320, 'PowerMax Co'),
('Laptop Stand', 650, 'ErgoProducts'),
('Portable Speaker', 920, 'TechSuppliers Ltd'),
('LED Desk Lamp', 560, 'BrightLite Pvt Ltd'),
('Water Bottle', 220, 'PureDrink Supplies'),
('Notebook Set', 240, 'PaperHouse'),
('Headphones', 990, 'AudioTech Solutions'),
('Webcam', 870, 'VisionCorp'),
('Phone Case', 300, 'MobileMart'),
('Backpack', 880, 'CarryAll Bags'),
('Smartwatch Strap', 410, 'AudioTech Solutions'),
('HDMI Cable', 260, 'TechSuppliers Ltd'),
('Power Bank', 750, 'PowerMax Co');

SELECT * FROM products ORDER BY product_id desc;

SELECT p.product_id,
	   p.product_name,
       p.price,
       p.supplier_name,
CASE 
       WHEN p.price >= 500 THEN 'EXPENSIVE'
       ELSE 'AFFORDABLE'
       END AS price_category,       
(
SELECT COUNT(*) 
FROM products p1
WHERE p1.supplier_name= p.supplier_name
)
AS supplier_count,

CASE
      WHEN p.supplier_name IS NOT NULL THEN p.supplier_name
      ELSE 'NO SUPPLIER'
      END AS suppliers,
(
(SELECT COUNT(*)
FROM products p1
WHERE p1.supplier_name = p.supplier_name ) >= 2
) AS big_supplier
FROM products p
ORDER BY p.product_name
LIMIT 10;

