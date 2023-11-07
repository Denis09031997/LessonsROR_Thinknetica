# Циклы

range = (1..7)

for i in range
  puts i
end

puts '______________________________'

name = 'Denis'

name.each_char do |i|
  puts i
end

# Цикл while. Выполняется только в том случае, если установленное для него условие - истинно:
puts '-------------------------'
index = 0

while index < 5 do
  puts index
  index += 2
end

puts '-------------------------'

puts 'Эксперимент с молоком:'

milk = 'Домик в деревне'

milk_num = 0

while milk_num < 7 do
  puts milk[milk_num]
  milk_num += 1
end

puts '-------------------------------'

# Цикл until - антипод цикла while. Выполняется до тех пор, пока условие ложно:
puts '__________________________________'
index = 0
until index > 5 do
  puts index
  index += 2
end

puts '---------------------'

str_2 = 'Huawei'

index2 = 0

while index2 < str_2.length do
  puts str_2[index2]
  index2 += 1
end

puts '-------------'

=begin
Метод циклов
До сих пор мы изучали один способ повторения действий в Ruby: использование циклов. Однако,
как это часто бывает в Ruby, существует не один способ решения поставленной задачи.
В данном случае повторить действие можно и с помощью итератора.

Итератор - это просто метод Ruby, который многократно вызывает блок кода.
Блок кода - это часть кода, содержащая инструкции, которые нужно повторить, и эти инструкции могут
быть практически любыми!

Простейшим итератором является метод цикла. Вы можете создать базовый (но бесконечный!) цикл,
просто набрав:
=end

# loop { print "Hello, world!" }

=begin
Ключевое слово next может быть использовано для пропуска определенных шагов в цикле. Например,
если мы не хотим выводить четные числа, мы можем написать:
=end

for i in 1..5
  next if i % 2 == 0
  puts i
end

puts '----------------------------'

=begin
Рассмотрим еще пример работы loop цикла:
В этом примере у нас есть переменная `i`, которая инициализируется значением 0.
Затем мы используем цикл `loop`, который будет выполняться бесконечно, пока не будет выполнено условие выхода.

Внутри цикла мы выводим сообщение с номером текущей итерации, увеличиваем значение
переменной `i` на 1 и проверяем, равно ли значение `i` 5. Если это условие выполняется,
то мы выходим из цикла с помощью ключевого слова `break`.

Таким образом, в этом примере цикл `loop` будет выполняться 5 раз, и на каждой итерации будет
выводиться сообщение с номером текущей итерации от 0 до 4.
=end

i = 0
loop do
  puts "Это итерация #{i}"
  i += 1
  break if i == 5
end

=begin
Итератор цикла является самым простым, но и одним из наименее мощных.
Более полезным итератором является метод .each, который позволяет применять выражение к каждому
элементу объекта по очереди. Синтаксис выглядит следующим образом:
=end

#object.each { |item|
  # Do something
#}

=begin
Вместо {} можно также использовать ключевое слово do:

object.each do |item|
  # Do something
end

Имя переменной между | | | может быть любым: это просто место для каждого элемента объекта,
для которого используется .each.
=end

puts '------------'

odds = [1, 3, 5, 7, 9]

odds.each do |i|
  puts i * 2
end

=begin
Метод .times похож на сверхкомпактный цикл for: он может выполнять задачу над каждым элементом объекта
заданное количество раз.
=end

5.times do
  puts 'Hello!'
end

puts '---------------'

num_start = 1

while num_start <= 50 do
  puts num_start
  num_start += 1
end
