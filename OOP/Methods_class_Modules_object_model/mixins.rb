# МИКСИНЫ - ВЫДЕЛЕНИЕ ОБЩЕЙ ЛОГИКИ.

# Для примера создадим методы которые заправляют бак и показывают уровень бака.

# Общий код, который повторяется для разных классов - можно вынести в модуль. Просто объявление модуля не достаточно,
# чтобы он включился в классах. Его нужно включить в класс, в котором функционал должен появиться - при помощи
# ключевого слова include

module FuelTank # Этот модуль мы сможем подключить в любой объект, где есть топливный банк
  def fill_tank(level)
    self.fuel_tank = level
  end

  def fuel_level
    self.fuel_tank
  end

  protected

  attr_accessor :fuel_tank
end

# module Debugger # подключим его через  extend
#   def debug(log)
#     puts "!!! DEBUG #{log} !!!"
#   end
# end

=begin
Иногда бывает необходимость в одном модуле совместить и методы класса и методы экземпляра класса (инстанс методы).
Для этого существует определенный прием - предположим есть метод дебаггер и есть метод дебаг, он допустим существует как
метод класса, также мы хотим чтобы был метод дебаг, чтобы он был как инстанс метод, чтобы не приходилось вызывать как
self.class.debug и мыхотим чтобы был еще инстанс метод, например, принт класс, который просто напишет имя класса.
Чтобы совместить в одном модуле и методы класса и методы экземпляра - они разделяются еще на два модуля:
=end

module Debugger
  module ClassMethods
    def debug(log)
      puts "!!! DEBUG: #{log} !!!"
    end
  end

  module InstanceMethods
    def debug(log)
      self.class.debug(log)
    end

    def print_class
      puts self.class #  self Является указателем на объект, того класса в который включен в модуль
      # Таким образом, модуль, который оригинальный, в который вложено все, т.е дебаггер сам становится
      #  объявлением пространства имен. Методы содержатся в 2х вложенных модулях - класс и инстанс.
    end
  end
end

class Car
  # Разница между include и extend: include - вкл.методы, которые есть в модуле, extend - методы, которые есть в модуле,
  #  как методы класса, т.е для их вызова уже не нужен объект
 
  include FuelTank
  extend Debugger::ClassMethods
  include Debugger::InstanceMethods
  attr_reader :current_rpm
  # добавим счетчик класса

  @@instances = 0 # переменная класса


  # Первый способ объявления метода класса при помощи self:

  # def self.description
  #   puts 'Это родительский класс всех авто'
  # end

  # Перемещаем в модуль
  # def self.debug(log)
  #   puts "!!! DEBUG #{log} !!!"
  # end

  debug 'START DEBUG'

  def self.instances
    @@instances
  end

  # Если несколько методов класса нужно записать и не хочется постоянно писать 'self' - применим другой синтаксис:

  class << self
    def description
      puts 'Это родительский класс всех авто '
    end

    def description2
      puts '2ой метод родительского класса всех авто'
    end

    # Все методы в этой конструкции будут методами класса.
  end

  # а если добавим такой метод без self - это будет методом инстанса

  def description
    puts 'Метод экземпляра класса Car.'
  end

  def initialize
    @current_rpm = 0
    @@instances += 1
    # # Для того чтобы вызвать из инстанс метода, метод класса нужно написать:
    # self.class.debug 'initialize'
    debug 'initialize'
  end

  def fill_tank(level)
    self.fuel_tank = level
  end

  def fuel_level
    self.fuel_tank
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    current_rpm.zero?
  end

  debug 'STOP DEBUG!!!'

  protected

  attr_writer :current_rpm
  attr_accessor :fuel_tank
  def initial_rpm
    700
  end


  def start_engine!
    self.current_rpm = initial_rpm
  end
end

class MotorBike
  include FuelTank
  extend Debugger::ClassMethods
  include Debugger::InstanceMethods

  debug 'MotorBike clas!!!'
end

car = Car.new
p car
bike = MotorBike.new
p bike
p car.fill_tank(50)
p bike.fill_tank(30)
p '-----------------------------------------'
p car.fuel_level
p bike.fuel_level

puts '_' * 50
volvo = Car.new
puts "Volvo = #{volvo}"
volvo.print_class