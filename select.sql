USE my_shop;


SELECT * FROM cities;

SELECT s.id, c.name, s.address
FROM shops s
JOIN cities c ON s.city_id = c.id;

SELECT count(*) AS total , manufactr_name FROM product_group GROUP BY manufactr_name ORDER BY total ; 

SELECT ORDER_id, surname, sum(total) AS total FROM full_order GROUP BY order_id;

SELECT * FROM products_count pc WHERE counts > 30;

SELECT sc.name, c.name, mc.name FROM sub_category sc
JOIN category c ON sc.category_id = c.id
JOIN main_category mc ON c.main_category_id = mc.id
WHERE mc.name = 'Стройматериалы';


