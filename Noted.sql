SELECT id, title, release_date, rating
FROM movies
WHERE release_date BETWEEN '2020-01-01 00:00' AND '2020-12-31 23:59'

SELECT id, name
FROM actors
WHERE name LIKE '%s'

SELECT id, title, release_date, rating
FROM movies
WHERE rating BETWEEN 4 AND 7 AND release_date BETWEEN '2004-01-01 00:00' AND '2010-12-31 23:59'

SELECT id, title, release_date, rating
FROM movies
WHERE EXTRACT(YEAR FROM movies.release_date) = 2020


SELECT 
FROM products
WHERE 

CREATE TABLE promos (
  'id' INT  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  'name' VARCHAR(255),
  'discount' int
);

CREATE TABLE products (
  'id' INT  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  'created_at' TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  'updated_at' TIMESTAMP NULL,
    'name' VARCHAR(255) ,
    'promo_id' INT,
    'price' INT
);

ALTER TABLE 'products' ADD FOREIGN KEY ('promo_id') REFERENCES 'promos' ('id');

INSERT INTO promos ("name", "discount") VALUES
('Soft Opening', 10000),
('Gajian', 5000),
('Lebaran Haji', 15000);

INSERT INTO "products" ("name", "promo_id", "price") VALUES
('Tea', NULL, 10000),
('Coffee', 1, 12000),
('Cake', 1, 22000),
('Fried Rice', 2, 15000);

SELECT prd.id AS "Product Id", prd.name AS "Nama Product", prd.price AS "Harga", pro.name AS "Nama Promo", pro.discount AS "Diskon"
FROM products prd
LEFT JOIN promos pro ON prd.promo_id = pro.id

SELECT prd.id AS "Product Id", prd.name AS "Nama Product", prd.price AS "Harga", pro.name AS "Nama Promo", pro.discount AS "Diskon"
FROM products prd
FULL JOIN promos pro ON prd.promo_id = pro.id

SELECT prd.id AS "Product Id", prd.name AS "Nama Product", prd.price AS "Harga", pro.name AS "Nama Promo", pro.discount AS "Diskon"
FROM promos pro
RIGHT JOIN products prd ON  pro.id = prd.promo_id

SELECT prd.id AS "Product Id", prd.name AS "Nama Product", prd.price AS "Harga", pro.name AS "Nama Promo", pro.discount AS "Diskon"
FROM promos pro
CROSS JOIN products prd;

SELECT prd.id AS "Product Id", prd.name AS "Nama Product", prd.price AS "Harga", pro.name AS "Nama Promo", pro.discount AS "Diskon", prd.price-COALESCE(pro.discount, 0) AS "Total Harga"
FROM products prd
LEFT JOIN promos pro ON prd.promo_id = pro.id

SELECT prd.promo_id AS "ID Promo", MIN(prd.price) AS "Harga Terkecil"
FROM products prd
WHERE prd.promo_id is NOT NULL
GROUP BY prd.promo_id
ORDER BY prd.promo_id ASC;

SELECT pro.id AS "ID Promo", pro.name AS "Nama Promo", MAX(prd.price) AS "Harga Terbesar"
FROM products prd
INNER JOIN promos pro ON prd.promo_id = pro.id
GROUP BY pro.na
ORDER BY prd.promo_id ASC;

