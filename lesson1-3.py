#3. Узнайте у #пользователя число n. Найдите сумму чисел n + nn + nnn.
# Например, пользователь ввёл число 3. Считаем 3 + 33 + 333 = 369.
n = input("Введи число n: \n")
nn =  n + n
nnn = n + n + n
var_int = int(n)+int(nn)+int(nnn)
print("n + nn + nnn = " , var_int)