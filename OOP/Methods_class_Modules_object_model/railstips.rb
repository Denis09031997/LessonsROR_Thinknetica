# Переменные класса: www.railstips.org

# Переменные класса
# Переменные класса - это очень просто. Просто создайте новый класс, используйте символ @@ для обозначения переменной 
# на уровне класса и добавьте метод getter, как показано ниже:

class Polygon
  @@sides = 10
  def self.sides
    @@sides
  end
end

puts Polygon.sides

# Когда вы задаете переменную класса, вы задаете ее для суперкласса и всех подклассов.

class ClonePolygon < Polygon
  @@sides = 777
end

puts Polygon.sides
puts ClonePolygon.sides

class ClonePolygonClone < Polygon
  @@sides = 101
end
puts Polygon.sides
puts ClonePolygon.sides
puts ClonePolygonClone.sides
puts '.' * 120

=begin
Переменные экземпляра на уровне класса
Что такое класс? Это объект. Что могут иметь объекты?
Объекты могут иметь переменные класса и экземпляра. Это означает, что класс может иметь переменные экземпляра.
Давайте снова откроем наш класс Polygon и добавим переменную экземпляра:
=end

class Polygon2
  @@variable = 'Это переменная класса.'
  @variable = 'А это уже переменная экземпляра класса.'
  def self.sides
    @@sides
  end
end

puts Polygon2.class_variables
puts Polygon2.instance_variables


# Итак, давайте попробуем повторить процедуру наследования, начав с нуля, и на этот раз
# мы будем использовать переменные экземпляра на уровне класса.

class VariableClass
  attr_accessor :date
  # создали для экземпляра, если попытаемся вывести на классе - будет ошибка.
  @date = '09/03/1997'
end

puts '-' * 100
# Создадим метод экземпляра на уровне класса.

class MethodExempleClass
  class << self; attr_accessor :birthday end
  @birthday = 1997
end

puts MethodExempleClass.birthday

=begin
Это добавляет методы-аксессоры боковых атрибутов на уровень класса, а не на уровень экземпляра.
В результате мы получаем переменную экземпляра на уровне класса. Теперь попробуем наследование:
=end


class Triangle < MethodExempleClass
  @birthday = 1988
end

puts Triangle.birthday
puts MethodExempleClass.birthday

=begin
Теперь каждый класс может иметь свое количество сторон. Теперь встает вопрос о том, как задать значение по умолчанию.
Можно предположить, что следующее значение будет равно 1997, что является значением по умолчанию 
ля MethodExempleClass. но это было бы неправильно. Как же нам обойти эту проблему? Мы создаем модуль для выполнения
грязной работы, который можно включить в любой класс, чтобы можно было повторно использовать
эту функциональность.

module ClassLevelInheritableAttributes
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def inheritable_attributes(*args)
      @inheritable_attributes ||= [:inheritable_attributes]
      @inheritable_attributes += args
      args.each do |arg|
        class_eval %(
          class << self; attr_accessor :#{arg} end
        )
      end
      @inheritable_attributes
    end

    def inherited(subclass)
      @inheritable_attributes.each do |inheritable_attribute|
        instance_var = "@#{inheritable_attribute}"
        subclass.instance_variable_set(instance_var, instance_variable_get(instance_var))
      end
    end
  end
end

Когда этот модуль включается в класс, он добавляет два метода класса: inheritable_attributes и inherited.
Наследуемый метод класса работает так же, как и метод self.included в приведенном выше модуле. Всякий раз,
когда класс, включивший этот модуль, становится подклассом, он устанавливает переменную экземпляра уровня класса
для каждой из объявленных переменных экземпляра уровня класса, наследуемых (@inheritable_attributes). Если это не
имеет смысла, то можно поступить следующим образом:

class Polygon
  include ClassLevelInheritableAttributes
  inheritable_attributes :sides
  @sides = 8
end

puts Polygon.sides # => 8

class Octogon < Polygon; end

puts Polygon.sides # => 8
puts Octogon.sides # => 8

=end
