#2. Представлен список чисел.
# Необходимо вывести элементы исходного списка, значения которых больше предыдущего элемента.
# Подсказка: элементы, удовлетворяющие условию, оформить в виде списка.
# Для формирования списка использовать генератор.

a = [10, 5, 30, 15, 50]
print(a)
b = [int(i) for i in a]
for i in range(1, len(b)):
    if b[i] > b[i - 1]:
        print(b[i])