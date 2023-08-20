str_1 = 'Пример строки'

puts str_1.length
puts str_1.upcase

list_str = str_1.split(//)
puts 'Разбитая строка:'
print list_str

puts '---------------'

letters = ['a', 'b', 's', 'd', 'e', 'f']

letters.each do |letter|
  puts letter
end

puts '-----------------'

puts 'Enter text:'
text_enter = gets.chomp

words_text = text_enter.split

words_text.each do |i|
  print i + ' '
end

puts 'Программа по замене текста'

puts 'Enter TEXT:'

enter_text_user = gets.chomp
puts 'Enter text redact:'
redact = gets.chomp

split_text = enter_text_user.split(' ')

puts split_text

split_text.each do |i|
  if i.upcase == redact.upcase
    puts 'REDACTED'
  else
    puts i
  end
end

