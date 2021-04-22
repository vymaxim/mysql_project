USE my_shop;

INSERT INTO cities (name) VALUES
('Воронеж'),
('Белгород'),
('Москва');

INSERT INTO shops (city_id, address) VALUES
(1, 'Воронежская обл., Новоусманский р-н, п. Отрадное, ул. Автодорожная д. 11'),
(1, 'Воронежская обл., Рамонский р-н, пос. Солнечный, ул. Парковая д. 5'),
(2, 'Белгородская область, п. Дубовое, мкр. Пригородный, ул. Щорса 64б'),
(3, 'г. Москва, ул. Верхняя Красносельская, 3А'),
(3, 'Московская область, деревня Шолохово, Дмитровское шоссе, вл. 8, стр.1');

INSERT INTO users (name, surname, phone, email) VALUES
('Максим','Аврошин','+79161541265','avrosin@mail.ru'),
('Елена','Кудрявых','+79653256574','kydr@mail.ru'),
('Ирина','Сияня','+78563259878','sin@mail.ru'),
('Кирилл','Пупкин','+79365479863','pupkin@mail.ru'),
('Степан','Птаев','+79514587962','ptaev@mail.ru'),
('Дмитрий','Ломов','+79624568521','lomov@mail.ru')
;

INSERT INTO main_category (name) VALUES
('Стройматериалы'),
('Столярные изделия'),
('Инструменты')
;

INSERT INTO category (name, main_category_id) VALUES
('Сухие смеси и грунтовки', 1),
('Изоляционные материалы', 1),
('Листовые материалы', 1),
('Древесно-плитные материалы', 2),
('Пиломатериалы', 2),
('Отделка деревом', 2);

INSERT INTO sub_category (name, category_id) VALUES
('Штукатурки', 1),
('Смеси для пола', 1),
('Теплоизоляция', 2),
('Гидроизоляция', 2),
('Гипсокартон', 3),
('Гипсоволокнистые листы', 3),
('ОСП-3', 4),
('Фанера', 4),
('Бруски', 5),
('Доски', 5),
('Вагонка', 6),
('Доска пола', 6);

INSERT INTO manufacturers (name) VALUES
('Ultralam'),
('Knauf'),
('unis');

INSERT INTO products (name, description, sub_category_id, manufacturers_id) VALUES 
('Штукатурка гипсовая ротбанд',
'это универсальная гипсовая штукатурная смесь для ручной отделки потолков и стен',
1, 2),
('Штукатурка гипсовая Теплон','подходит для внутренней отделки стен и потолков', 1, 3),
('Наливной пол Unis Горизонт','Быстротвердеющий наливной пол', 2, 3),
('Стяжка пола Unis Горизонт','Ровнитель для пола, усиленный армирующими волокнами', 2, 3),
('Утеплитель Кнауф ТеплоКнауф Стена','Минеральная вата ТеплоKnauf «Стена» предназначена для утепления и шумоизоляции каркасных стен', 3, 2),
('Гипсокартон влагостойкий','Влагостойкий гипсокартон (гипрок, ГКЛВ)', 5, 2),
('Гипсоволокнистый лист', '«Кнауф-Суперпол» — экологически чистый, морозоустойчивый материал с высокими свойствами термо- и звукоизоляции', 6, 2),
('Плита OSB-3 ',' Плита OSB-3 от ULTRALAM ', 7, 1),
('Планкен строганый','Планкен из массива натуральной древесины предназначен для декоративной облицовки внутренних и наружных поверхностей', 10, null);

INSERT INTO units (name) VALUES
('kg'), 
('mm');

INSERT INTO products_type (product_id, unit_id, unit_value, price) VALUES
(1, 1, 5, 217),
(1, 1, 25, 534),
(2, 1, 5, 237),
(2, 1, 25, 476),
(3, 1, 5, 50),
(3, 1, 25, 156),
(3, 1, 50, 350),
(4, 1, 5, 180),
(4, 1, 25, 430),
(5, 2, 50, 670),
(5, 2, 100, 1200),
(6, 2, 9, 345),
(6, 2, 12, 523),
(7, 2, 10, 540),
(7, 2, 20, 980),
(8, 2, 9, 470),
(8, 2, 12, 640),
(9, 2, 110, 307),
(9, 2, 140, 467);

INSERT INTO photo (product_id, name) VALUES
(1, 'shtyk.jpg'),
(1, 'shtyk1.jpg'),
(1, 'shtyk2.jpg');

INSERT INTO products_count (shop_id, product_type_id, counts) VALUES 
(1, 1, 10),
(2, 1, 5),
(3, 1, 34),
(4, 1, 0),
(5, 1, 23),
(1, 2, 10),
(2, 2, 5),
(3, 2, 34),
(4, 2, 0),
(5, 2, 23),
(1, 3, 10),
(2, 3, 5),
(3, 3, 34),
(4, 3, 0),
(5, 3, 23),
(1, 4, 10),
(2, 4, 5),
(3, 4, 34),
(4, 4, 0),
(5, 4, 23),
(1, 5, 10),
(2, 5, 5),
(3, 5, 34),
(4, 5, 0),
(5, 5, 23);

INSERT INTO orders (user_id) VALUES 
(1),
(5),
(4);

INSERT INTO orders_product (order_id, product_type_id, counts) VALUES
(1, 10, 10),
(1, 3, 3),
(2, 2, 5),
(2, 1, 7),
(2, 3, 1),
(3, 6, 2),
(3, 7, 1);

























