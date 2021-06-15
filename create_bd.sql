DROP DATABASE IF EXISTS my_shop;

CREATE DATABASE IF NOT EXISTS my_shop;

USE my_shop;


CREATE TABLE IF NOT EXISTS cities (
    id bigint unsigned NOT NULL AUTO_INCREMENT,
    name varchar(55) UNIQUE NOT NULL,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY id (id)
);

CREATE TABLE IF NOT EXISTS users (
	id SERIAL PRIMARY KEY,
 	name varchar(55) NOT NULL,
    surname varchar(55) NOT NULL,
    phone varchar(55) UNIQUE NOT NULL,
    email varchar(55) UNIQUE NOT NULL,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS shops(
	id SERIAL PRIMARY KEY,
	city_id bigint UNSIGNED NOT NULL,
	address varchar(155) NOT NULL,
  	created_at datetime DEFAULT CURRENT_TIMESTAMP,
 	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	KEY index_of_city_id  (city_id),
 	CONSTRAINT fk_city_id_shops FOREIGN KEY (city_id) REFERENCES cities (id)
);

CREATE TABLE IF NOT EXISTS main_category(
	id SERIAL PRIMARY KEY,
	name varchar(55) NOT NULL,
  	created_at datetime DEFAULT CURRENT_TIMESTAMP,
 	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS category(
	id SERIAL PRIMARY KEY,
	name varchar(55) NOT NULL,
	main_category_id bigint UNSIGNED NOT NULL, 
  	created_at datetime DEFAULT CURRENT_TIMESTAMP,
 	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	KEY index_of_main_category_id  (main_category_id),
 	CONSTRAINT fk_main_category_id_category FOREIGN KEY (main_category_id) REFERENCES main_category (id)
);

CREATE TABLE IF NOT EXISTS sub_category(
	id SERIAL PRIMARY KEY,
	name varchar(55) NOT NULL,
	category_id bigint UNSIGNED NOT NULL,
  	created_at datetime DEFAULT CURRENT_TIMESTAMP,
 	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	KEY index_of_category_id (category_id),
 	CONSTRAINT fk_category_id_sub_category FOREIGN KEY (category_id) REFERENCES category (id)
);

CREATE TABLE IF NOT EXISTS manufacturers(
	id serial PRIMARY KEY,
	name varchar(55) NOT NULL,
	created_at datetime DEFAULT CURRENT_TIMESTAMP,
 	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	
);

CREATE TABLE IF NOT EXISTS products(
	id SERIAL PRIMARY KEY,
	name varchar(55) NOT NULL,
	description varchar(255) DEFAULT NULL ,
	sub_category_id bigint UNSIGNED NOT NULL,
	manufacturers_id bigint UNSIGNED DEFAULT NULL,
  	created_at datetime DEFAULT CURRENT_TIMESTAMP,
 	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	KEY index_of_sub_category_id (sub_category_id),
 	KEY index_of_manufacturers_id (manufacturers_id),
 	CONSTRAINT fk_sub_category_id_products FOREIGN KEY (sub_category_id) REFERENCES sub_category (id),
 	CONSTRAINT fk_manufacturers_id_products FOREIGN KEY (manufacturers_id) REFERENCES manufacturers (id)
);

CREATE TABLE IF NOT EXISTS units(
	id SERIAL PRIMARY KEY,
	name varchar(55) NOT NULL,
	created_at datetime DEFAULT CURRENT_TIMESTAMP,
 	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products_type(
	id SERIAL PRIMARY KEY,
	product_id bigint UNSIGNED NOT NULL,
	unit_id bigint UNSIGNED NOT NULL,
	unit_value bigint UNSIGNED NOT NULL,
	price bigint UNSIGNED NOT NULL,
	created_at datetime DEFAULT CURRENT_TIMESTAMP,
 	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	KEY index_of_unit_id (unit_id),
 	KEY index_of_product_id (product_id),
 	CONSTRAINT fk_unit_id_products_type FOREIGN KEY (unit_id) REFERENCES units (id),
 	CONSTRAINT fk_product_id_products_type FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE IF NOT EXISTS photo(
	id serial PRIMARY KEY,
	product_id bigint UNSIGNED NOT NULL,
	name varchar(55) UNIQUE NOT null,
	created_at datetime DEFAULT CURRENT_TIMESTAMP,
 	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	KEY index_of_product_id (product_id),
 	CONSTRAINT fk_product_id_photo FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE IF NOT EXISTS products_count(
	shop_id bigint UNSIGNED NOT NULL,
	product_type_id bigint UNSIGNED NOT NULL,
	counts bigint UNSIGNED NOT NULL,
  	created_at datetime DEFAULT CURRENT_TIMESTAMP,
 	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	KEY index_of_shop_id (shop_id),
 	KEY index_of_product_type_id (product_type_id),
 	CONSTRAINT fk_shop_id_products_count FOREIGN KEY (shop_id) REFERENCES shops (id),
 	CONSTRAINT fk_product_type_id_products_count FOREIGN KEY (product_type_id) REFERENCES products_type (id)
);

CREATE TABLE IF NOT EXISTS orders(
	id serial PRIMARY KEY,
	user_id bigint UNSIGNED NOT NULL,
	created_at datetime DEFAULT CURRENT_TIMESTAMP,
	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMp,
	KEY index_of_user_id (user_id),
	CONSTRAINT fk_user_id_orders FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS orders_product(
	id serial PRIMARY KEY,
	order_id bigint UNSIGNED NOT NULL,
	product_type_id bigint UNSIGNED NOT null,
	counts bigint UNSIGNED NOT NULL,
	created_at datetime DEFAULT CURRENT_TIMESTAMP,
	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY index_of_order_id (order_id),
	KEY index_of_product_type_id (product_type_id),
	CONSTRAINT fk_order_id_order_product FOREIGN KEY (order_id) REFERENCES orders (id),
	CONSTRAINT fk_product_type_id_order_product FOREIGN KEY (product_type_id) REFERENCES products_type (id)
);

CREATE TABLE IF NOT EXISTS email_newsletter(
	user_id bigint UNSIGNED NOT NULL,
	newsletter bool DEFAULT FALSE,
	created_at datetime DEFAULT CURRENT_TIMESTAMP,
 	updated_at datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	KEY index_of_user_id (user_id),
 	CONSTRAINT fk_user_id_newsletter FOREIGN KEY (user_id) REFERENCES users (id)
);


delimiter //

CREATE TRIGGER newsletters after insert ON users
FOR EACH ROW 
BEGIN
	INSERT INTO email_newsletter (user_id) VALUES (NEW.id);
END //

delimiter ;

