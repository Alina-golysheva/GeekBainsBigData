#В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
#Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
START TRANSACTION;
INSERT INTO simple.users SELECT *  FROM shop.users WHERE id = 1;
DELETE FROM shop.users WHERE id = 1;
commit;


#Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.
CREATE OR REPLACE VIEW prods AS
SELECT
  c.name as cat_name,
  p.name
  FROM
  products AS p
left JOIN
  catalogs AS c
ON
  c.id = p.catalog_id;
  select * from prods ;