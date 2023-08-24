=begin
оператор case, который будет решать, какие действия предпринять в зависимости от того, что вводит пользователь.

Операторы if и else очень мощные, но мы можем запутаться в if и else, если у нас много условий для проверки.
К счастью, Ruby предоставляет нам краткую альтернативу: оператор case.

else - это то, что будет делать оператор case, если ни один из его операторов when не соответствует случаю.

=end

puts 'На каком языке программируете?'
language = gets.chomp

case language
when "JS"
  puts "Websites!"
when "Python"
  puts "Science!"
when "Ruby"
  puts "Web apps!"
else
  puts "I don't know!"
end

movies = {
  Star_Wars: 5,
  Divergent: 10,
  Doctor_Strange: 9,
  IronMan: 9,
  X_man: 10
}

puts 'Что хотите сделать?'
choice = gets.chomp

case choice
when 'add'
  puts 'Введите название фильма:'
  title = gets.chomp
  puts 'Введите рейтинг фильма:'
  rating = gets.chomp
  if movies.key?(title) == true
     puts 'Такой уже есть'    
  else
    movies[title.to_sym] = rating.to_i
  end
when 'update'
  puts 'Введите название фильма:'
  title = gets.chomp
  if movies.has_key?(title.to_sym) == false
    puts 'Такого фильма нету!'
  else
    puts 'Введите новый рейтинг'
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
  end
when 'display'
  movies.each do |k, v|
    puts "#{k}: #{v}"
  end
when 'delete'
  puts 'Какой фильм хотите удалить?'
  title = gets.chomp
  if movies.has_key?(title.to_sym) == false
    puts 'Такого фильма нету!'
  else
    movies.delete(title.to_sym)
  end
else
  puts 'Error'
end


puts movies

=begin
Четыре глагола, которые знает ваша программа, - добавить, отобразить, обновить и удалить - являются универсальными.
 Эта аббревиатура более известна как CRUD - create, read, update и delete (соответственно). 
 Именно эти действия вы выполняете, когда обновляете запись в базе данных, запрашиваете информацию на сайте или 
 пишете статью в блоге. Знакомство с этой схемой полезно, поскольку она встречается во всем - от вызовов API до
  веб-фреймворков типа Ruby on Rails.
=end

