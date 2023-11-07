#  codecademy

my_array = [4, 8, 15, 16, 23, 42]

puts my_array[2]

string_array = ['Denis', 'KIA', 'XIAOMI', 'HUAWEI']

puts string_array

array_arrays = [[12, 34, 22], ['a', 'b', 's', 'd'], ['Lanister', 'Targarier']]

array_arrays.each { |i| puts "array_arrays = #{i}\n" }

=begin
в многомерных массивах количество элементов в каждом подмассиве должно быть одинаковым.
Внутри многомерного массива все подмассивы должны иметь одинаковую длину. В противном случае,
если длины подмассивов различаются, это может привести к ошибкам при доступе к элементам и обработке данных.
=end

frequencies = Hash.new(0)

puts frequencies

puts '------------- PRACTIC ---------------------------'

puts 'Enter text, please:'
text = gets.chomp
words = text.split
puts words
frequencies = Hash.new(0)

words.each do |str|
  frequencies[str] += 1
end

frequencies = frequencies.sort_by do |key, value|
  value
end

frequencies.reverse!

p '------------------------------------------'

frequencies.each do |key, count|
  puts key + " " + count.to_s
end
