=begin
Методы класса:
Что это?

Методы класса - это методы, которые принадлежат самому классу, а не его экземплярам (объектам).
Они могут быть вызваны напрямую через имя класса, без создания объекта.
Как объявляются?

Объявляются с использованием ключевого слова self перед именем метода.
=end

class MyClass
  def self.class_method
    puts "This is a class method"
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
end

MyClass.class_method

=begin
Модули:
Что это?

Модули - это коллекции методов, констант и классов, предназначенные для включения в другие классы.
Они используются для организации и облегчения поддержки кода.
Как объявляются?

Объявляются с использованием ключевого слова module.
=end

module MyModule
  def module_method
    puts "This is a module method"
  end
end


=begin
Объектная модель Ruby:
Что это?

Объектная модель Ruby описывает способ, с помощью которого Ruby представляет и работает с данными и объектами.
Ключевые аспекты:

Все в Ruby является объектом, включая числа, строки, массивы и даже классы.
Классы в Ruby тоже являются объектами и могут быть динамически изменены во время выполнения программы.
Использование:
Методы класса:

Используются для функциональности, применимой ко всем объектам данного класса.
=end

class MyClass
  def self.class_method
    puts "This is a class method"
  end
end

MyClass.class_method

=begin
Модули:

Используются для организации и переиспользования функциональности в разных классах.
=end
module MyModule
  def module_method
    puts "This is a module method"
  end
end

=begin
Объектная модель Ruby:

Понимание того, что все является объектом, помогает понять, как работают методы, переменные и наследование в Ruby.
Важно помнить:
Модули могут быть включены в класс с использованием include, что позволяет им воспользоваться методами модуля.

Объекты могут иметь свои собственные методы, но они также могут использовать методы класса и методы из
подключенных модулей.

В Ruby есть множество встроенных модулей, которые предоставляют различные функциональности, такие как Enumerable,
Comparable и другие.
=end
