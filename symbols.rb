# Symbols

=begin
Символы трудно объяснить, они находятся на полпути между строкой и числом. Символ можно узнать по тому,
что он начинается с двоеточия, а затем с одной или нескольких букв, например :flag или :best_friend.

Символы (symbols) в Ruby представляют собой особый тип данных, который используется для
представления имени или идентификатора. Они очень похожи на строки (строковые литералы),
но есть несколько ключевых различий, которые делают символы полезными в определенных ситуациях.

Основные характеристики символов:

Уникальность: Символы в Ruby уникальны в пределах всей программы. Это означает,
что каждый символ с определенным именем существует только в единственном экземпляре.

Эффективность: Символы используют меньше памяти, чем строки, так как они существуют в
единственном экземпляре. Это делает их полезными, если вам нужно представить множество одинаковых имен
или идентификаторов.

Неизменяемость: Символы неизменяемы, то есть вы не можете изменить содержимое символа после его создания.
Это может быть полезно для представления константных значений, таких как имена методов или ключи для хешей.
=end

puts 'hello'.methods.count
puts :hello.methods.count

my_symbol = :example

# Использование символов в качестве ключей в хеше

person = {
  name: 'Denis',
  age: 26,
  occupation: :developer
}

# Обращение к символам в хеше
puts person[:name]

# Сравнение символов
if my_symbol == :example
  puts "Это символ :example"
end
