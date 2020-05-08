use vk;
#Пусть задан некоторый пользователь. 
#Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

select from_user_id, count(*) as cnt from message   
where to_user_id = 1 or from_user_id = 1
group by from_user_id
order by cnt desc;

#Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
select count(*) from likes 
where user_id in 
  (select  user_id from profiles
   order by birthday desc
   limit 10);

#Определить кто больше поставил лайков (всего) - мужчины или женщины?

select
'gender_f',
	count(*) as cnt
	from likes
	where user_id in (select  user_id from profiles where gender = 'f') 
UNION
select
'gender_m',
	count(*)  as cnt
	from likes
	where user_id in (select  user_id from profiles where gender = 'm');
 
#Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

select  user_id,  count(user_id) as cnt from likes
   group by user_id 
   order by cnt
   limit 10