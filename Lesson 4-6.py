#6. Реализовать два небольших скрипта: \
# a) бесконечный итератор, генерирующий целые числа, начиная с указанного,
# б) бесконечный итератор, повторяющий элементы некоторого списка, определенного заранее.
# Подсказка: использовать функцию count() и cycle() модуля itertools.
#a)
from itertools import count
for el in count(12):
    print(el)
#b)
from itertools import cycle
с = 0
for el in cycle("123456"):
    print(el)
    с += 1
