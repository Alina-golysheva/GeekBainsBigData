#3. Пользователь вводит месяц в виде целого числа от 1 до 12.
# Сообщить к какому времени года относится  месяц (зима, весна, лето, осень).
# Напишите решения через list и через dict.
my_dict = {1:'Зима', 2:'Весна',3:'Лето',4:'Осень'}
my_list = ['янв', 'фев', 'мар', 'апр', 'май', 'июн', 'июл', 'авг', 'сен', 'окт', 'ноя', 'дек']
user_var = int(input("Напишите номер месяца "))
if user_var == 1 or user_var == 2 or user_var == 12 :
    print(my_list[user_var - 1])
    print(my_dict.pop(1))
elif user_var == 3 or user_var == 4 or user_var == 5 :
    print(my_list[user_var - 1])
    print(my_dict.pop(2))
elif user_var == 6 or user_var == 7 or user_var == 8 :
    print(my_list[user_var - 1])
    print(my_dict.pop(3))
elif user_var == 9 or user_var == 10 or user_var == 11 :
    print(my_list[user_var - 1])
    print(my_dict.pop(4))
else:
    print("Неверный ввод!")