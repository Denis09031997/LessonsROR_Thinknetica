# ИСКЛЮЧЕНИЯ

=begin
Любые методы можно разделить на 2 категории:
Методы-команды, выполняющие некоторые действия
Методы-вопросы (предикаты), которые возвращают true/false

В скринкасте метод validate! является методом-командой, поэтому он не должен возвращать значение true, он должен только 
делать проверки и выбрасывать исключения, если проверки не пройдут. А метод valid? является как раз методом-предикатом, 
поэтому он и должен возвращать true/false

В итоге более правильной будет следующая реализация методов:

def validate!
  raise ... if ...
  raise ... if ...
end

def valid?
  validate!
  true # возвращаем true, если метод validate! не выбросил исключение
rescue
  false # возвращаем false, если было исключение
end

т.е. просто переносим true из метода validate! в метод valid?
=end

=begin
## Исключения (Exceptions)

- Механизм сообщения об ошибках и их обработки
- Избавляют от кодов возврата и их анализа
- Разделяют код, в котором возникает ошибка и код, который ее обрабатывает
- Исключения - это объекты подкласса Exceptions
- Есть встроенные классы исключений, можно писать свои

Как только в программе случается исключение, Ruby останавливает дальнейшее выполнение программы.
Для обработки исключений, нужно поместить код в данную конструкцию:
=end
begin 
  puts 'Before exception'
  # 4/2
  1/0
  puts 'After exception'
rescue
  puts "You can't do that!"
end

# В случае если случается исключение, Ruby передает управление в блок rescue
puts '.' * 100

# Для вызова сообщения из исключения используется следующий код:

begin 
  puts 'Before exception'
  Math.sqrt(-1)
rescue Exception => e
  puts "Exception (какое было исключение): #{e.message}"
end

=begin
Немнонго подробнее про данный код:

begin и end:

begin и end обрамляют блок кода, в котором могут возникнуть исключения.
puts 'Before exception':

Выводит строку "Before exception" на экран до выполнения кода, который может вызвать исключение.
Math.sqrt(-1):

Этот код пытается вычислить квадратный корень из -1 с использованием метода sqrt из модуля Math. Однако попытка
извлечь квадратный корень из отрицательного числа приведет к ошибке.

rescue Exception => e:

rescue используется для перехвата и обработки исключений. Здесь мы перехватываем объект исключения и присваиваем его 
переменной e.
Exception - это базовый класс для всех исключений в Ruby. В данном случае, мы ловим любое исключение, которое может 
возникнуть.
=> e позволяет нам получить доступ к объекту исключения, который мы называем e.
puts 'Exception: #{e.message}':

Выводит строку "Exception:" на экран, за которой следует сообщение об ошибке, полученное из объекта исключения через 
e.message.

=end
puts '-' * 120
# В случае если в коде есть метод для обработки исключения, следующий после него код выполнится:

begin 
  puts 'Before exception'
  Math.sqrt(-1)
rescue Exception => e
  puts "Exception: #{e.message}"
end

puts 'Идем дальше'
puts '-' * 120

# Если же убрать блок rescue, весь код после него не будет выполнен

# Можно указать конкретный тип ошибок из иерархии выше:


begin 
  puts 'Before exception'
  Math.sqrt(-1)
rescue StandardError => e
  puts "Exception: #{e.message}"
end

puts "Идем дальше"

# Можно так же обрабатывать сразу несколько типов исключений:
puts '_' * 100
puts 'Обработка нескольких типов исключений:'

begin 
  puts 'Before exception'
  Math.sqrt(-1)
rescue StandardError => e
  puts "Exception: #{e.message}"
rescue NoMemoryError => e
  puts "No memory!!!"
end

puts "Идем дальше"

=begin
Когда и какие исключения обрабатывать

- Обрабатывать только те исключения, которые вы знаете как обрабатывать
- Если вы не знаете, как обработать исключение - не обрабатывать
- Лучше отлавливать конкретные типы исключений, а не Exception
- Часто требуется после обработки выбросить исключение повторно (вызов raise из блока rescue без параметров)
=end
puts '.' * 120
puts 'Выброс исключения с помощью блока raise для конкретного типа:'

def method_with_error
  #......
  raise ArgumentError, "Oh no!"
end

begin 
  method_with_error
rescue ArgumentError => e
  puts e.inspect
end

puts "After exception"

# В функциях есть более короткий способ обработать конкретное исключение:
puts '-' * 100

def sqrt(value)
  sqrt = Math.sqrt(value)
  puts sqrt
rescue StandardError
  puts "Неверное значение"
end

sqrt(144)
sqrt(-1)
sqrt(36)

puts '_' * 120

=begin
Для того что бы попробовать выполнить действие еще раз(в данном случае 3 раза) и не сразу пугать пользователя 
исключениями, используется следущая конструкция:
=end

def connect_to_wikipedia
  #.....
  raise "Connection error"
end

attempt = 0
begin
  connect_to_wikipedia
rescue RuntimeError
  attempt += 1
  retry if attempt < 3
  puts "Check your internet connection!"
end

# Разберем подробно этот код:

=begin
Код выполняет попытку подключения к Википедии с использованием метода `connect_to_wikipedia`. Если при вызове этого 
метода происходит исключение типа `RuntimeError` (в данном случае, "Connection error"), код переходит к блоку `rescue`.

1. `attempt = 0`: Инициализация переменной `attempt` счетчиком попыток, которая будет отслеживать, сколько раз мы 
пытаемся выполнить подключение.

2. `begin`: Начало блока, в котором выполняется основной код.

3. `connect_to_wikipedia`: Вызов метода для подключения к Википедии. Если при выполнении этого метода происходит 
исключение типа `RuntimeError`, код переходит к блоку `rescue`.

4. `rescue RuntimeError`: Обработчик исключения типа `RuntimeError`. В этом блоке увеличивается счетчик попыток 
(`attempt += 1`), и если количество попыток меньше 3, то код в блоке `retry if attempt < 3` возвращается к метке 
`begin` и выполняет подключение снова. Если количество попыток достигло 3, выводится сообщение "Check your internet 
connection!".

5. `end`: Завершение блока `begin`.

Таким образом, код позволяет выполнить подключение к Википедии не более трех раз, прежде чем выдать 
сообщение об ошибке. Это дает пользователю несколько попыток перед тем, как сообщить о проблеме с подключением.

Ключевое слово retry в Ruby используется внутри блока rescue для повторного выполнения блока begin с самого начала. 
При вызове retry, управление передается обратно к метке begin, и код внутри этого блока выполняется снова.


=end

puts "#{'-' * 35} 'ensure' #{'-' * 35}"

# В случае, если нам к примеру нужно вывести количество попыток исключения, существует конструкция "ensure", 
# код в которой выполнится в любом случае:

def connect_to_wikipedia
  #.....
  raise "Connection error"
end

attempt = 0
begin
  connect_to_wikipedia
rescue RuntimeError
  attempt += 1
  retry if attempt < 3
  puts "Check your internet connection!"
ensure
  puts "There was #{attempt} attempts"
end

puts '_______________________________________________________'
puts 'Обработка исключений в классе Car'

class Car
  attr_accessor :number

  def validate!
    raise "Number can't be nill" if number.nil?
    raise "Number should be at least 6 symbols" if number.length < 6
    true
  end
end

=begin
raise "Number can't be nil" if number.nil?: Здесь проверяется, что значение атрибута number не равно nil. Если оно 
nil, то генерируется исключение с сообщением "Number can't be nil". Это исключение будет "всплывать" в вызывающий код, 
и его можно будет обработать блоком rescue.

raise "Number should be at least 6 symbols" if number.length < 6: Здесь проверяется длина значения атрибута number. 
Если длина меньше 6 символов, генерируется исключение с сообщением "Number should be at least 6 symbols". 
Также, это исключение может быть обработано блоком rescue.

Если ни одно из условий не выполняется, метод возвращает true, что может быть использовано для указания успешной 
валидации.
=end

puts 'var 1:'

car = Car.new
car.number = "ABC123"

begin
  car.validate! # Здесь может произойти исключение, если условия в методе не выполнены
  puts "Validation successful!" # Если метод успешно завершен без исключений
rescue StandardError => e
  puts "Validation failed: #{e.message}" # Обработка исключений
end

puts 'var 2:'

car2 = Car.new
car2.number

begin
  car2.validate! # Здесь может произойти исключение, если условия в методе не выполнены
  puts "Validation successful!" # Если метод успешно завершен без исключений
rescue StandardError => e
  puts "Validation failed: #{e.message}" # Обработка исключений
end


puts 'var 3:'

car3 = Car.new
car3.number = "777"

begin
  car3.validate! # Здесь может произойти исключение, если условия в методе не выполнены
  puts "Validation successful!" # Если метод успешно завершен без исключений
rescue StandardError => e
  puts "Validation failed: #{e.message}" # Обработка исключений
end

puts '-' * 100
puts 'Перепишем класс так, что нельзя будет создать его объект без указания номера:'

class Car_version2
  attr_accessor :number

  def initialize(number)
    @number = number
    validate!
  end
  def validate!
    raise "Number can't be nill" if number.nil?
    raise "Number should be at least 6 symbols" if number.length < 6
    true
  end
end

=begin
В новой версии класса `Car_version2` внесены следующие изменения:

1. Добавлен конструктор `initialize(number)`, который принимает параметр `number` и устанавливает значение атрибута 
`@number`. После установки номера вызывается метод `validate!` для проверки валидности.

2. Метод `validate!` остался таким же, как и в предыдущей версии класса. Он проверяет, что значение `number` 
не равно `nil` и имеет длину не менее 6 символов. Если условия не выполняются, генерируются исключения.

Таким образом, в новой версии класса `Car_version2` объект этого класса можно создать только при условии передачи 
номера при вызове конструктора `initialize`. Если номер не передан или не соответствует условиям валидации, 
будет выброшено исключение, предотвращая создание объекта с некорректными данными.
=end

# Валидный номер
valid_car = Car_version2.new("ABC123")
puts "Valid car number: #{valid_car.number}" # Выведет "Valid car number: ABC123"

# Невалидный номер (менее 6 символов)
begin
  invalid_car = Car_version2.new("123")
rescue StandardError => e
  puts "Error: #{e.message}" # Выведет "Error: Number should be at least 6 symbols"
end

# Невалидный номер (nil)
begin
  invalid_car = Car_version2.new(nil)
rescue StandardError => e
  puts "Error: #{e.message}" # Выведет "Error: Number can't be nil"
end

