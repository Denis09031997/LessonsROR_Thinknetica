=begin
Хеши - это что-то вроде объектов JavaScript или словарей Python.
 Если вы не изучали эти языки, то вам достаточно знать, что хэш - это коллекция пар ключ-значение.
  Синтаксис хэша выглядит следующим образом:
=end

person = {
  'name' => 'Denis',
  'country' => 'Russia',
  'age' => 26
}


puts person["name"]
puts person['country']
puts person['age']

hash_new = Hash.new

hash_new['cat'] = 'Jack'

puts hash_new['cat']

work = ['AG', 'Backend', 'investor']

collegies = {
  'operators' => ['Alibek', 'Kristy', 'Nata'],
  'OM' => ['Danil', 'Alex', 'Elena'],
  'KM' => [ 'Jana', 'Olga', 'Max' ]
}

puts '-------------------------------------------------'

work.each do |x|
  puts x
end

puts '__________________________________________________________'

collegies.each do |var, key|
  puts "#{var}: #{key}"
end

p 'То же самое:'

collegies.each { |k, v| puts "#{k} - #{v}" }

stak = ['html', 'css', 'ruby', 'rails']

stak.each do |x|
  puts x
end

puts '_______________________________________________________________________'

s = [["ham", "swiss"], ["turkey", "cheddar"], ["roast beef", "gruyere"]]

s.each do |sub_array|
  p sub_array
  sub_array.each do |element|
    puts element
  end
end

# Перебор hash

restaurant_menu = {
  "noodles" => 4,
  "soup" => 3,
  "salad" => 2
}

restaurant_menu.each do |item, price|
  puts "#{item}: #{price}"
end

secret_identities = {
  "The Batman" => "Bruce Wayne",
  "Superman" => "Clark Kent",
  "Wonder Woman" => "Diana Prince",
  "Freakazoid" => 'Dexter Douglas'
}

secret_identities.each {|hero, acter| puts "#{hero}: #{acter}"}

