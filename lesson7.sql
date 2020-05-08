# lesson 7
# Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
use shop;
SELECT * FROM users
WHERE EXISTS (SELECT 1 FROM orders WHERE user_id = orders.id);

# Выведите список товаров products и разделов catalogs, который соответствует товару.
SELECT
  c.name,
  p.name,
  p.price
  FROM
  products AS p
left JOIN
  catalogs AS c
ON
  c.id = p.catalog_id;
  
# (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). Поля from, to и label 
# содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
 from_1 VARCHAR(255) COMMENT 'Откуда',
 to_1 VARCHAR(255) COMMENT 'Куда'
  ) COMMENT = 'полеты';
INSERT INTO `shop`.`flights` (`id`, `from_1`, `to_1`) VALUES ('1', 'moskow', 'omsk');
INSERT INTO `shop`.`flights` (`id`, `from_1`, `to_1`) VALUES ('2', 'novgorod', 'kazan');
INSERT INTO `shop`.`flights` (`id`, `from_1`, `to_1`) VALUES ('3', 'irkutsk', 'moskow');
INSERT INTO `shop`.`flights` (`id`, `from_1`, `to_1`) VALUES ('4', 'omsk', 'irkutsk');
INSERT INTO `shop`.`flights` (`id`, `from_1`, `to_1`) VALUES ('5', 'moskow', 'kazan');
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
label VARCHAR(255) ,
name VARCHAR(255) 
  ) COMMENT = 'названия';
INSERT INTO `shop`.`cities` (`label` , `name`) VALUES ( 'moskow', 'Москва');
INSERT INTO `shop`.`cities` (`label` , `name`) VALUES ( 'novgorod', 'Новгород');
INSERT INTO `shop`.`cities` (`label` , `name`) VALUES ( 'irkutsk', 'Иркутск');
INSERT INTO `shop`.`cities` (`label` , `name`) VALUES ( 'kazan', 'Казань');
INSERT INTO `shop`.`cities` (`label` , `name`) VALUES ( 'omsk', 'Омск');

SELECT
 flights.id,
  (SELECT
 	cities.name
   FROM
 	cities
   WHERE
 	cities.label = flights.from_1 ) AS 'FROM',
    (SELECT
 	cities.name
   FROM
 	cities
   WHERE
 	cities.label = flights.to_1 ) AS 'TO'
FROM
  flights;
