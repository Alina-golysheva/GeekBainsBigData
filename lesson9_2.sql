#Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
#С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
#с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
DELIMITER //
DROP PROCEDURE IF EXISTS Hello//
CREATE PROCEDURE Hello()
BEGIN
 if (SELECT HOUR(now()) BETWEEN 12 and 17) then
	select ('Добрый день!') ;
 elseif (SELECT HOUR(now()) BETWEEN 18 and 23) then
  select ('Добрый вечер!') ;
elseif (SELECT HOUR(now()) BETWEEN 0 and 11) then
  select ('Добрый Утро!') ;
else
  select ('Добрый Ночи!') ;
end if;
end //
CALL Hello;

#В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
#Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
#Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
#При попытке присвоить полям NULL-значение необходимо отменить операцию.

DELIMITER //
CREATE 
TRIGGER check_null BEFORE INSERT 
ON products
FOR EACH ROW BEGIN
IF NEW.name IS NULL AND NEW.desription is NULL THEN 
SET NEW.desription ='неопределен';
END IF;
END;//
DELIMITER ;

INSERT INTO `shop`.`products` ( `name`, `desription`, `price`, `catalog_id`) 
VALUES (NULL, NULL, '4090.00', '2');

