''#4. Пользователь вводит строку из нескольких слов, разделённых пробелами. Вывести каждое слово с новой строки.
#Строки необходимо пронумеровать. Если в слово длинное, выводить только первые 10 букв в слове.
user_list = input("Ваша любимая пословица?:")
list1 = user_list.split(' ')
i = 0
for el in list1:
    i+=1
    print(str(i) + ' ' + str(el[0:10]))
