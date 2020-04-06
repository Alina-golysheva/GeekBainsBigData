use shop;
#Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
insert into users (created_at, updated_at )
values (now(), now());
#Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения
SELECT
  id,
  name,
  birthday_at,
  date_format(updated_at,  '%d.%m.%Y %hh:%mm') AS updated_at,
  date_format(created_at,  '%d.%m.%Y %hh:%mm') AS created_at
FROM
  users;
#В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
SELECT
 *
FROM
  storehouses_products
ORDER BY
CASE
 WHEN value = 0 THEN 999999999 ELSE value 
end;
#Подсчитайте средний возраст пользователей в таблице users
SELECT
  avg((TO_DAYS(NOW()) - TO_DAYS(birthday_at))/365.25) AS age_avg
FROM
  users;
  
# Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.

select 
date_format(DATE_FORMAT(birthday_at, '%d.%m.2020'), '%W') AS weekday ,
count(id)   as qqq
 from
  users
  group by  weekday;
  
  