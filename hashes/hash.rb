# Хэш (словарь)

=begin
Записывается следующим образом(если в качестве значения используется символ,
перед самим значением ставится двоеточие):
=end

hash1 = {a: 1, 'b' => 2, c: 9}
puts hash1
puts hash1['b']
puts hash1[:c]
months = {'january' => 31, 'february' => 28, 'march' => 31}
puts months
months['february'] = 29
puts months
puts months.keys
puts months.values
# Проверка наличия определенного ключа:
puts hash1.include? :a
# Преобразование хэша в массив:
puts hash1.to_a.inspect
# Вложенный хэш выглядит подобным образом:
regions = {77 => {title: 'Москва', code: 495}, 78 => {title: 'C.-Петербург', code: 812} }
puts regions
# Получение элементов вложенного хэша:
puts regions[77][:code]
