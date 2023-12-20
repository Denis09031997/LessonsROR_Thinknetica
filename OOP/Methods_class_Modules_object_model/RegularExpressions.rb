# Регулярные выражения

# Регулярные выражения (regex или regexp) в Ruby — это мощный инструмент для работы с текстовыми данными. 
# Они представляют собой шаблоны для поиска, извлечения и замены подстрок в строках.

=begin
- Шаблон (образец) строки
- Зачем:
    - Строки можно сравнивать на соответствие шаблону:
        - формат телефонного номера
        - формат email
    - Можно искать вхождение подстроки по шаблону
    - Делать замену подстроки, соответствующей шаблону
    - и т. п.
=end

# Вот краткий обзор основных понятий и использования регулярных выражений в Ruby:

# Создание регулярного выражения:

regexp = /.+/

puts regexp

regex = /pattern/

puts regex

# или

regex2 = Regexp.new("pattern")

puts regex2

puts 'Простой поиск:'

text = "Hello, world!"
match = text.match(/world/)
puts match[0] # Выведет "world"

# Проверка на соотвествие строки:
'a' =~ regexp

# Проверка на несоответсвие строки:
'a' !~ regexp

# Для тестирования регулярных выражений используйте данный сайт - https://rubular.com

puts 'напишем регулярное выражение для проверки формата номера(1 буква, 3 цифры , 2 буквы):'

regexp = /^[a-я]{1}\d{3}[a-я]{2}$/i

puts 'Practic. Добавим проверку соответствия номера формату в класс Car:'

class Car
  attr_accessor :number

  NUMBER_FORMAT = /^[a-я]{1}\d{3}[a-я]{2}$/i

  def initialize(number)
    @number = number
    validate!

  end
  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "ПУСТО!!" if number.nil?
    raise "НОМЕР МЕНЕЕ 6ТИ СИМВОЛОВ" if number.length < 6
    raise "НЕ ВЕРНЫЙ ФОРМАТ НОМЕРА" if number !~ NUMBER_FORMAT
    true
  end
end

kia = Car.new('Х101РХ')
