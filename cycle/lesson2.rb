=begin
В Ruby есть еще один цикл, о котором не рассказано в скринкасте. Это цикл loop. 
Он представляет собой бесконечный безусловный цикл. Полезен, например, как цикл ожидания ввода 
(например, выводит меню и ждет от пользователя выбор). Его можно прервать по ключевому слову break 
(как и любой другой цикл).

При помощи loop и break, а также условных операторов можно реализовать цикл с пост-условием, 
т.е. цикл, который выполнится как минимум 1 раз.
=end

loop do
  puts 'Считаем идеальный вес.'
  puts 'Считаем площадь треугольника'
  puts 'EXIT'
  puts 'Что еще делаем?'
  input = gets.chomp
  break if input == 'ничего'
end

puts '---------------'
puts 1.object_id
puts 1.object_id
puts 1.object_id
puts '-' * 100
# Однако, для строк по-прежнему сохраняется утверждение, что object_id у одинаковых строк будет разный, 
# т.е. если написать
puts '1'.object_id
puts '1'.object_id
puts '1'.object_id