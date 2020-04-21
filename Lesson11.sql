#Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products 
#в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и содержимое поля name.

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP ,
  name_table VARCHAR(255) COMMENT 'Имя таблицы',
  table_ins INT COMMENT 'идентификатор первичного ключа',
  name_ins VARCHAR(255) COMMENT 'Значение поля name'
  ) COMMENT = 'логирование данных таблиц users, catalogs и products' ENGINE=Archive;
  
  DELIMITER //
CREATE 
TRIGGER loggi AFTER INSERT 
ON users
FOR EACH ROW BEGIN
INSERT INTO logs (created_at, name_table , table_ins , name_ins) VALUES (now(), users,  products.id) ;
END;//
DELIMITER ;

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-11-05'),
  ('Наталья', '1974-11-12');
  
# Создайте SQL-запрос, который помещает в таблицу users миллион записей.
DELIMITER //
CREATE PROCEDURE dowhile()
BEGIN
  DECLARE i INT DEFAULT 10;
  WHILE i <= 1000000 DO
    INSERT shop.user (username, password) VALUES (i , i);
    SET i = i + 1;
  END WHILE;
END//
DELIMITER ;
CALL dowhile();
SELECT * FROM shop.users;
