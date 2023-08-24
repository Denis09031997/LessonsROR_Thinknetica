# HASHES

breakfast = { 
  "bacon" => "tasty",
  "eggs" => "tasty",
  "oatmeal" => "healthy",
  "OJ" => "juicy"
}

my_hash = {
  'one' => 1,
}

breakfast.each do |key, value|
  puts "key = #{key}, value = #{value}"
end

puts "Попробуем получить доступ к несуществующему ключу, например - cola: #{breakfast['cola']}, и к существующему =  #{breakfast['OJ']}"

no_nil_hash = Hash.new()
no_nil_hash2 = Hash.new('Trady Blix')

puts "#{no_nil_hash['key']}, #{no_nil_hash2['key']}"

# Ключи символы

# Что такое символ? Символ в Ruby можно рассматривать как своего рода имя.
# Важно помнить, что символы не являются строками:

puts "string" == :string

=begin
Помимо различий в синтаксисе, есть еще одно ключевое свойство символов, которое отличает их от строк.
В то время как может существовать множество различных строк, имеющих одно и то же значение,
в каждый момент времени существует только одна копия любого конкретного символа.
Синтаксис символов
Символы всегда начинаются с двоеточия (:). Они должны быть именами допустимых переменных Ruby, поэтому первым
символом после двоеточия должна быть буква или знак подчеркивания (_); после этого допускается любая комбинация букв,
цифр и знаков подчеркивания.

Убедитесь, что в имени символа нет пробелов - если они есть, Ruby запутается.

Символы встречаются в Ruby во многих местах, но в основном они используются либо в качестве хэш-ключей,
либо для ссылок на имена методов.

Символы являются хорошими хэш-ключами по нескольким причинам:

Они неизменяемы, то есть не могут быть изменены после их создания;
В каждый момент времени существует только одна копия любого символа, поэтому они экономят память;
Символы-как-ключи работают быстрее, чем строки-как-ключи, по двум вышеуказанным причинам.



=end

puts '--------------------------------'

puts "string".object_id
puts "string".object_id

puts :symbol.object_id
puts :symbol.object_id

my_first_symbol = :Denis

sounds = {
  :cat => 'meow',
  :dog => 'woof',
  :computer => 10010010100,
}

puts sounds[:dog]
puts sounds[:cat]

puts '_______________________________________'

# Преобразование между строками и символами выполняется очень просто.

str_1 = :symbol_in_string.to_s
sym = 'string_to_symbol'.to_sym

puts str_1.class
puts sym.class

strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
mas_sym = []

strings.each do |elem|
  mas_sym.push(elem.to_sym)
end

p mas_sym

=begin
Помимо использования .to_sym, можно также использовать .intern. В этом случае строка превращается в символ и 
работает так же, как и .to_sym:
=end

p 'hello'.intern

movies = {
  :agent_sheild => 'Сериал Марвел про агентов ЩИТ, которые спасают землю от Гидры и инопланетян',
  :doctor_who => 'Сериал про путешествия во времени, снят Великобританией',
  :loss => 'Сериал про авиакатастрофу и загадочный остров',
}

puts movies[:agent_sheild]

puts '______________________________________________'

=begin
Однако в версии Ruby 1.9 синтаксис хэшей изменился. Как раз в тот момент, когда вам было удобно!

Хорошая новость заключается в том, что измененный синтаксис проще, чем старый синтаксис хэш-ракеток, 
и если вы привыкли к объектам JavaScript или словарям Python, то он покажется вам очень знакомым:
=end

new_hash3 = { 
  one: 1,
  two: 2,
  three: 3
}

new_hash3.each do |key, value|
  puts "key class #{key} =  #{key.class}"
end

# что если мы хотим отфильтровать хэш по значениям, удовлетворяющим определенным критериям? 
# Для этого мы можем использовать .select.

movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 5,
  truman_show: 4,
  red_dawn: 1.5,
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}
# Add your code below!

good_movies = movie_ratings.select {|name, raiting| raiting > 3}

puts good_movies

# А еще можно делать перебор чисто по ключу или по значению:

movie_ratings.each_key do |key|
  puts key
end

