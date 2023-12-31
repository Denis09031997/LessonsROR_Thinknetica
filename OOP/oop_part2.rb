# OOP. Classes, objects, interactions.

=begin
tiny class, one method

новички в ООП обычно довольно легко понимают концепцию класс-объект на примере одного класса с методами, которые
вызываются на объекте
к примеру напишем простой класс Car:
=end

=begin
initialize method

также обычно не вызывает сложностей в понимании и некоторое усложнение класса
например:
в классе может быть метод initialize, который принимает аргументы и присваивает их значения инстанс-переменным

теперь при инициализации объекта мы должны передать в аргументах метода .new номер и мы можем увидеть в irb,
что этот номер присвоен соответствующей переменной объекта класса Car

adding getter and setter
можно добавить еще один аттрибут и пару геттер-сеттер к нему
можно даже устанавливать в методе initializeзначение по умолчанию для этого нового аттрибута
пусть автомобиль имеет аттрибут “цвет” и пусть при создании нового автомобиля его цвет устанавливается в значение “белый”
при этом у автомобиля есть методы, с попощью которых можно узнать цвет или поменять его (как в примере ниже):

геттер и сеттер, чтобы не быть многословными можно переписать с помощью встроенного метода Руби attr_accessor:


=end

class Car
  attr_accessor :color

  # initialize
  def initialize(number)
    @number = number
    @color = 'white'
  end

  def beep
    puts 'Beep! Beep!'
  end
  
  # меняем на attr_accessor
  # def color=(color) 
    # @color = color
  # end

  # def color
    # @color
  # end
end

# Создаем объект

kia_rio = Car.new(101)
kia_rio.beep
p kia_rio
# класс загружен, объект создан, метод вызван у объекта, результат совпадает с ожиданиями… отлично! 
# initialize method - тоже работает
kia_rio.color = 'Urban Grey'
puts kia_rio.color

bmw3 = Car.new(222)
puts bmw3.beep
bmw3.color = 'black'
puts bmw3.color


puts '-' * 100
puts '_' * 100

=begin
предположим по заданию наш автомобиль должен обладать следующими качествами:

“Имеет номер, который указывается при создании”
“Имеет цвет, при создании цвет устанавливается в значение ‘white’”
“Может выводить в консоли ‘beep beep’”
“Может возвращать цвет, может менять цвет”
“Знает имена, допущенных к управлению водителей”
“Может добавлять имена водителей в список имен водителей”
“Может возвращать список имен водителей”
“Может выводить список имен водителей”
мы здесь должны добавить функциональность, связанную с именами водителей
в коде это может выглядеть вот так:

=end

class MyCar
  attr_accessor :color
  attr_reader :drives_names

  def initialize(number)
    @number = number
    @color = 'black'
    @drives_names = []
  end

  def beep
    puts 'Beep! Beep!'
  end

  def add_driver(name)
    @drives_names << name
  end

  def show_drivers
    @drives_names.each { |name| puts name}
  end
end

=begin
что нового в нашем классе ?

чтобы выполнить пункт ТЗ “Знает имена, допущенных к управлению водителей” в классе Car появилась еще одна
инстанс-переменная и ридер (геттер) для нее
эта переменная инициализируется со значением “пустой массив”
в качестве реализации пункта “Может добавлять имена водителей в список имен водителей” добавился метод add_driver(name),
который добавляет элементы в массив, храняшийся в @drivers_names
наконец метод show_drivers реализует пункт “Может выводить список имен водителей”
=end

# Итак - испытаем:

my_car = MyCar.new(101)
p my_car
my_car.add_driver('Denis Sherbinin')
my_car.add_driver('My Girlfriend')
my_car.show_drivers
my_car.color = 'Urban Grey'
p my_car
