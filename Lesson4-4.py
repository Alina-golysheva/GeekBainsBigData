#4. Представлен список чисел. Определить элементы списка, не имеющие повторений.
# Сформировать итоговый массив чисел, соответствующих требованию.
# Элементы вывести в порядке их следования в исходном списке.
# Для выполнения задания обязательно использовать генератор.
a = [int(i) for i in input("Ваш список чисел:").split()]
for i in a:
   if a.count(i) == 1:
    print(i)