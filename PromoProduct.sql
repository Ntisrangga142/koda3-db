SELECT prd.promo_id AS "ID Promo", AVG(prd.price) AS "Harga Terkecil"
FROM products prd
WHERE prd.promo_id is NOT NULL
GROUP BY prd.promo_id
HAVING AVG(prd.price) > 16000;

SELECT prd.promo_id AS "ID Promo", MIN(prd.price) AS "Harga Terkecil"
FROM products prd
WHERE prd.promo_id is NOT NULL
GROUP BY prd.promo_id;

