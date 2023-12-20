# https://www.codegram.com/blog/understanding-class-instance-variables-in-ruby/
# Понимание переменных экземпляра класса в Ruby

=begin
Хорошо известно, что в Ruby, как и в любом объектно-ориентированном языке, есть переменные экземпляра и класса. 
Они широко используются, и вы можете узнать их по обозначениям @a и @@a соответственно.

Тем не менее, иногда этих инструментов недостаточно для решения некоторых проблем, большинство из которых связано с 
наследованием.

Например, давайте смоделируем домен, в котором есть несколько владельцев собак. Эти владельцы могут быть ботаниками, 
эмо или ненавистниками, и у каждого типа есть определенные предпочитаемые имена собак, которые будут полезными данными 
на определенном этапе работы программы. Мы можем попытаться хранить эти имена собак как переменные класса Nerd, Emo 
или Hater (кстати, Hater не предпочитает никаких имен). Мы также должны реализовать DogMixin, чтобы инкапсулировать 
присвоение и получение имен собак.

=end

# Первая версия программы выглядит следующим образом:

module DogMixin
  class << self
    def included(base)
      base.extend ClassMethods
    end
  end

  module ClassMethods
    # Присваивает предпочтительные имена собак переменной класса.
    def assign(*names)
      @@dog_names = names
    end

    def dog_names
      @@dog_names
    end
  end
end

class Owner
  include DogMixin
end

class Nerd < Owner
  assign :r2d2, :posix
end

class Emo < Owner
  assign :bill, :tom
end

class Hater < Owner
end

p Nerd.dog_names
# => [:bill, :tom]

p Emo.dog_names
# => [:bill, :tom]

p Hater.dog_names
# => [:bill, :tom]

=begin
Подожди... Ботаник предпочитает Билла и Тома в качестве собачьих имен? А Ненавистник? Нам сказали, что Ненавистник 
не предпочитает никаких имен! Давайте поподробнее разберемся с заданием:

module ClassMethods
  # Assigns the preferred dog names to a class variable.
  def assign(*dogs)
    @@dog_names = dogs
  end
  # ...
end

Проблема в том, что когда мы присваиваем имена @@dog_names, мы привязываем их к DogMixin::ClassMethods::@@dog_names, 
а не к именам Nerd, Emo или Hater. Это означает, что @@dog_names всегда ссылается на переменную класса модуля, которая 
одинакова для всех и изменяется каждый раз, когда класс вызывает .assign *names.

Итак, до сих пор была лишь небольшая путаница в метапрограммировании! Давайте попробуем это сделать с помощью 
class_variable_set и class_variable_get:
=end

puts '------------------Version 2:'

module DogMixin
  class << self
    def included(base)
      base.extend ClassMethods
    end
  end

  module ClassMethods
    def assign(*names)
      class_variable_set(:@@dog_names, names)
    end

    def dog_names
      class_variable_get(:@@dog_names)
    end
  end
end

class Owner
  include DogMixin
end

class Nerd < Owner
  assign :r2d2, :posix
end

class Emo < Owner
  assign :bill, :tom
end

class Hater < Owner
end

p Nerd.dog_names
# => [:r2d2, :posix]

p Emo.dog_names
# => [:bill, :tom]

# p Hater.dog_names
# => uninitialized class variable @@dog_names in Hater (NameError)

=begin
Теперь у каждого ботаника есть свои любимые собачьи имена! А Эмо могут продолжать обожать братьев Каулитц. 
Но что с Ненавистником? Поскольку он никогда не вызывал .assign, при получении кличек собак возникает ошибка.

=end

# Вы только что сказали "переменные экземпляра класса"?

=begin
Здесь мы представим немного странное понятие: переменные экземпляра класса. В принципе, вы можете узнать их, потому 
что они выглядят как переменные экземпляра, но вы найдете их на уровне класса.

Они работают как обычные переменные класса, но отличаются от них тем, что не разделяются с подклассами. Они принадлежат
исключительно самому классу.

Вы можете думать о них как о "переменных экземпляра объекта X", где X - это конкретный класс (помните, что классы - это 
тоже объекты в Ruby!). Начало.

Прежде чем погрузиться в область владельцев собак, давайте сделаем небольшой перерыв и посмотрим практический пример 
с типичным счетчиком экземпляров. На первом этапе мы используем обычные переменные класса:

=end

puts '-' * 120

class Person
  # @@count - это переменная класса, общая для Person и всех подклассов.
  # Когда вы инстанцируете Person или любой тип Person, например Worker,
  # счетчик увеличивается
  @@count = 0

  def initialize
    self.class.count += 1
  end

  def self.count
    @@count
  end

  def self.count=(value)
    @@count = value
  end

end

class Worker < Person
end

8.times { Person.new }
4.times { Worker.new }

p Person.count # => 12
p Worker.count # => 12

# Очевидно, что счетчик является общим для Person и всех его подклассов. Давайте воспользуемся подходом переменных 
# экземпляров классов и сделаем счетчик эксклюзивным для каждого класса:

puts '..........................Version 2:'

class Person
  # @count - это ИНСТАНЦИОННАЯ ПЕРЕМЕННАЯ КЛАССА, эксклюзивная для Person.
  # Только когда вы инстанцируете Person (не подкласс Person),
  # счетчик увеличивается.
  @count = 0

  def initialize
    self.class.count += 1
  end

  def self.count
    @count
  end
  def self.count=(value)
    @count = value
  end
end

class Worker < Person
  # @count - это переменная CLASS INSTANCE VARIABLE, эксклюзивная для Worker.
  # Только когда вы инстанцируете Worker, счетчик увеличивается
  @count = 0
end

8.times { Person.new }
4.times { Worker.new }

p Person.count # => 8
p Worker.count # => 4

puts '_' * 100

# Давайте применим это в реальной жизни!

module DogMixin
  class << self
    def included(base)
      base.extend ClassMethods
    end
  end

  module ClassMethods
    def assign(*names)
      # @собаки привязывается к подклассу EACH DogOwner

      @dog_names = names
    end

    def dog_names
      # @собаки привязывается к подклассу EACH DogOwner
      @dog_names
    end
  end
end

class Owner
  include DogMixin
end

class Nerd < Owner
  assign :r2d2, :posix
end

class Emo < Owner
  assign :bill, :tom
end

class Hater < Owner
end

p Nerd.dog_names
# => [:r2d2, :posix]

p Emo.dog_names
# => [:bill, :tom]

p Hater.dog_names
# => nil