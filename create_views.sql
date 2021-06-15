 USE my_shop;


CREATE VIEW product_group AS 
SELECT pt.id, u.name AS units, pt.unit_value, p.name, sc.name AS category, m.name AS manufactr_name
FROM products_type pt, units u, products p, sub_category sc, manufacturers m 
WHERE pt.product_id = p.id AND pt.unit_id = u.id AND p.sub_category_id = sc.id AND p.manufacturers_id = m.id
ORDER BY pt.id;

CREATE VIEW full_order as
SELECT op.order_id, p.name, pt.unit_value, u.surname, op.counts, pt.price, (op.counts * pt.price) AS total
FROM orders_product op, orders o , users u, products_type pt, products p
WHERE op.order_id = o.id AND o.user_id = u.id AND op.product_type_id = pt.id
AND pt.product_id = p.id
ORDER BY op.order_id;
