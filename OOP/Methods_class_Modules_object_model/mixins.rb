# МИКСИНЫ - ВЫДЕЛЕНИЕ ОБЗЕЙ ЛОГИКИ. 

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

module Debugger # подключим его через  extend
  def debug(log)
    puts "!!! DEBUG #{log} !!!"
  end
end

class Car
  # Разница между include и extend: include - вкл.методы, которые есть в модуле, extend - методы, которые есть в модуле, как методы класса, т.е для их вызова уже не нужен объект
 
  include FuelTank
  extend Debugger
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
    # Для того чтобы вызвать из инстанс метода, метод класса нужно написать:
    self.class.debug 'initialize'
  end

  def fill_tank(level)
    fuel_tank = level
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
  extend Debugger

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

# 32 МИН.