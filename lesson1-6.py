#6. Спортсмен занимается ежедневными пробежками. В первый день его результат составил a километров.
# Каждый день спортсмен увеличивал результат на 10 % относительно предыдущего.
# Требуется определить номер дня, на который общий результат спортсмена составить не менее b километров.
# Программа должна принимать значения параметров a и b и выводить одно натуральное число — номер дня.
a = int(input("Сколько вы пробежали сегодня: "))
b = int(input("Сколько вы хотели бы пробегать: "))
d = 0
while a < b:
    a = a * 0.1 + a
    d += 1
print("Вы сможете достичь своей цели за ",d , "дней")
