# Создали класс

class Car
  attr_writer :speed
  attr_reader :speed

  attr_reader :engine_volume

  def initialize(speed = 0, engine_volume = 1.6) # У нас могут быть разные параметры, нам нужна возможность управлять
    # объектом, с какими параметрами он будет создан. Для этого существуют параметры методов и конструкторов.
    # Использовать можем как локальные переменные.
    @speed = speed
    @engine_volume = engine_volume
  end

  def start_engine
    puts "Wroooom!"
  end

  def beep
    puts "beep beep!"
  end

  def stop
    # puts "STOP!"
    @speed = 0
  end

  def go
    speed = 40
    @speed = 50
    puts "Local speed: #{speed}, instans speed: #{@speed}"
  end

  def current_speed
    puts "Current speed: #{@speed}" # local speed #{speed} - получим ошибку, если добавить в код.
  end

  def speed
    @speed
  end

  def engine_volume
    @engine_volume
  end

  def set_speed(speed)
    @speed = speed
  end
end

# Создаем объект

# car = Car.new
# car2 = Car.new

# puts car
# puts car2

# puts car.object_id
# puts car2.object_id

#Вызываем метод
# car.start_engine
# car.beep
# car2.start_engine
# car2.beep
# car.stop
# car.stop

# Т.е создали класс, объекты, методы


=begin 
Теперь посмотрим как появляются данные в нашем классе. 
Данные в классе представленны так называемыми инстанс переменными.Или переменными экземпляра класса.
Напишем такой метод, как go - ну, заводим двигатель и начинаем движение. Метод будет устанавливать начальную скорость.
Но скорость текущая - это уже свойство объекта, атрибута - иными словами данные объекта. 
Свой-ва представляются: ИНСТАНС ПЕРЕМЕННЫМИ. Начинаются они со значка - @, 
далее пишем название и присваиваем им значение. (Это будет @speed)

Важнейшей концепцией инстанс переменных является, то что доступ к данной переменной мы имеем 
в любом методе нашего класса.В отличие от локальных переменных - локальные переменные
ограничиваются облатсью видимости в методе.

Инстанс переменные доступны в любом методе экземпляра класса. Они еще называются атрибутами. Часто требуется установить
начальное значение этих атрибутов. Для этого существует метод конструктор, этот метод вызывается в тот момент, 
когда мы создаем новый обхект. Создание нового объекта называется еще инстанцированием нового объекта.
Когда мы выполняем метод new - мы можем провести инициализацию наших переменных. Можем сделать начальную подготовку
наших данных.

Метод конструктор обычно пишется вначале класса и называется он initialize.

В рамках методов мы можем вызывать и другие методы класса, они будут вызывать друг друга.

Нам также нужны методы, которые будут менять значения.
=end

# puts 'Посмотрим текущую скорость:'

# car.current_speed
# car.go
# car.current_speed
# car.stop
# car.current_speed


# Практика с конструктором.

car = Car.new(20, 2.0)

car.current_speed
puts car.engine_volume

car = Car.new(0, 2.0)

car.current_speed
car.engine_volume
car.set_speed(80)
car.current_speed

=begin
Иногда бывает нужно устновить значение переменных по умолчанию. 
=end

car2 = Car.new

puts car2
car2.current_speed
car2.engine_volume
car.speed = 60
car.current_speed
