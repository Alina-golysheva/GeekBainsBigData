#5. Реализовать структуру «Рейтинг», представляющую собой не возрастающий набор натуральных чисел.
# У пользователя необходимо запрашивать новый элемент рейтинга.
# Если в рейтинге существуют элементы с одинаковыми значениями,
# то новый элемент с тем же значением должен разместиться после них.
#Подсказка. Например, набор натуральных чисел: 7, 5, 3, 3, 2.
#Пользователь ввел число 3. Результат: 7, 5, 3, 3, 3, 2.
#Пользователь ввел число 8. Результат: 8, 7, 5, 3, 3, 2.
#Пользователь ввел число 1. Результат: 7, 5, 3, 3, 2, 1.
#Набор натуральных чисел можно задать непосредственно в коде, например, my_list = [7, 5, 3, 3, 2].
my_list = [10, 9, 8, 7, 1]

print(my_list)
r1 = input("Введите число:")
r = int(r1)
c = my_list.count(r)
for el in my_list:
    if c > 0:
        i = my_list.index(r)
        my_list.insert(i+c, r)
        break
    else:
        if r > el:
            j = my_list.index(el)
            my_list.insert(j, r)
            break
        elif r < my_list[len(my_list) - 1]:
            my_list.append(r)
print(my_list)