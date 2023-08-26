array = [1, 2, 4, 'KIA', 23.11, [32, 11]]
puts array
puts array[3]
puts array.size
array.push('x101px')
puts array
puts array.first
puts array.last
array.delete('KIA')
array.delete(-1)
puts array
puts 'sort:'
ar_s = [1, 4, 11, 2, 3, 13, 99, 22, 105]
res = ar_s.sort
puts res
puts res.include?(11)
puts res.include?(777)
puts ' Интервал:'
puts (1..12).each {|i| puts i}
puts '________________________________________'
puts ('a'..'f').each {|i| puts i}
puts '________________________________________'

one = ["is", "this", "an", "array"]
puts one.sort

