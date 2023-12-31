# Инстанс-переменные уровня класса

=begin
Кроме инстанс-переменных и класс-переменных, в Ruby есть еще инстанс-переменные уровня класса 
(class level instance variables.) Раз класс - это объект класса Class, то как у любого объекта у него могут быть 
инстанс-переменные. Но при этом они задаются на уровне класса. Они похожи на переменные класса, но ими не являются и 
отличаются в поведении, например, они не наследуются. При этом, они явялются довольно мощным и удобным инструментом и 
даже рекомендуются как замена обычным переменным класса.

Инстанс-переменные уровня класса (class instance variables) в Ruby относятся к переменным, которые принадлежат 
конкретному экземпляру класса, но не делятся между экземплярами этого класса. Такие переменные создаются в 
контексте инстанса класса и могут использоваться только в методах экземпляра, но они не доступны в методах класса 
или в других экземплярах класса.

Давайте рассмотрим пример для лучшего понимания:
=end

class Dog
  @total_dogs = 0 # инстанс-переменная уровня класса

  def initialize(name)
    @name = name # инстанс-переменная
    self.class.total_dogs += 1
  end

  def self.total_dogs
    @total_dogs
  end

  def self.total_dogs=(value)
    @total_dogs = value
  end
end

=begin
@total_dogs инициализируется в контексте класса Dog и является инстанс-переменной уровня класса. Она принадлежит классу,
но не его экземплярам.

В конструкторе initialize при создании нового экземпляра класса Dog инстанс-переменная @name инициализируется для 
каждого инстанса отдельно. В этом случае, она является обычной инстанс-переменной.

В методе initialize также используется self.class.total_dogs += 1, чтобы увеличить значение инстанс-переменной уровня 
класса при создании нового экземпляра.

Методы self.total_dogs и self.total_dogs= предоставляют доступ к инстанс-переменной уровня класса извне класса. Эти 
методы являются методами класса.

=end

dog1 = Dog.new("Buddy")
puts Dog.total_dogs # Выведет: 1

dog2 = Dog.new("Max")
puts Dog.total_dogs # Выведет: 2

puts '-' * 120

=begin
Переменные класса (class variables):

Объявление: Начинаются с символа @@.
Принадлежность: Принадлежат самому классу.
Доступ: Доступны во всех методах класса и всех его экземплярах.
Пример:
=end

class MyClass
  @@class_variable = 0

  def self.class_variable
    @@class_variable
  end

  def self.class_variable=(value)
    @@class_variable = value
  end
end

=begin
Переменные экземпляра класса (instance variables):

Объявление: Начинаются с символа @.
Принадлежность: Принадлежат конкретному экземпляру класса.
Доступ: Доступны внутри всех методов объекта класса (экземпляра).
Пример:
=end

class MyClass2
  def initialize
    @instance_variable = 0
  end

  def instance_variable
    @instance_variable
  end

  def instance_variable=(value)
    @instance_variable = value
  end
end

=begin
Инстанс-переменные уровня класса (class instance variables):

Объявление: Начинаются с @ и присваиваются в контексте self.
Принадлежность: Принадлежат конкретному экземпляру класса.
Доступ: Доступны внутри методов объекта класса (экземпляра) и внутри методов класса (но не в методах экземпляра).
Пример:

=end

class MyClass3
  @class_instance_variable = 0

  def self.class_instance_variable
    @class_instance_variable
  end

  def self.class_instance_variable=(value)
    @class_instance_variable = value
  end
end

=begin
Отличия:

Переменные класса принадлежат самому классу и доступны внутри всех его методов, а также в методах всех 
экземпляров класса.

Переменные экземпляра класса принадлежат конкретному экземпляру класса и доступны внутри его методов.

Инстанс-переменные уровня класса принадлежат конкретному экземпляру класса и доступны внутри его методов, а также в 
методах класса (но не в методах экземпляра).
Примеры с пошаговыми комментариями:

=end

class VariableExample
  # Переменная класса
  @@class_variable = 'Переменная класса'

  # Переменная экземпляра класса
  def initialize
    @instance_variable = 'Переменная экземпляра класса'
  end

  # Инстанс-переменная уровня класса
  @class_instance_variable = 'Инстанс-переменная уровня класса'

  # Метод, который работает с переменной класса
  def self.class_variable_example
    @@class_variable = 'Переменная класса'
  end

  # Метод, который работает с переменной экземпляра
  def instance_variable_example
    @instance_variable = 'Переменная экземпляра класса'
  end

  # Метод, который работает с инстанс-переменной уровня класса
  def self.class_instance_variable_example
    @class_instance_variable = 'Инстанс-переменная уровня класса'
  end
end


# Создаем объект класса
obj = VariableExample.new

# Используем методы для переменных класса и экземпляра
p VariableExample.class_variable_example
p obj.instance_variable_example

# Используем метод для инстанс-переменной уровня класса
p VariableExample.class_instance_variable_example

# Важно помнить, что переменные класса могут привести к проблемам при наследовании, и их использование должно 
# быть оправданным.

puts '.' * 120

# Классы это объекты.

=begin
На Ruby, что любой код выполняется в контексте текущего обьекта (экземпляра класса), текущий объект всегда доступен
из псевдо-переменной self. Это базовые истинины. Но попорбуйте ответить на вопрос, в каком конексте (объекте) 
выполняется строка 4 и строка 2?
=end

class User
  @b = 1
  def a
    @a = 1
  end
end

# Строка 4 выполнится в экземпляре класса User, как мы и ожидаем, в объекте который вы создадите через 
# User.new

=begin
А строка 2 выполняется в экземпляре класса Class, в объекте который описывает класс User. Этот объект создатся сразу 
после чтения интерпретатором класса User.
Само слово User это не что иное как консанта, значение которой объект типа Class. Этот объект описывает наш класс User. 
Именно к этому объекту относится переменная @b. На самом деле она всегда была там. Не в классе B и не в экземпляре 
класса B, а в экземпляре класса Class хранимом в константе B.

=end

=begin
Что нам дают переменные экземпляра Class-уровня?

Они могут работать как личные переменные класса. В отличии от настоящих переменных класса, которые доступных во 
всех потомках и экземплярах под одним именем, наша переменная принадлежит только тому классу в контексте которого 
была объявлена.
=end

class B
  @b = 1
  def self.set_b( v ); @b = v;  end
  def self.get_b; @b; end
end

puts B.get_b   # => 1

puts B.set_b 2
puts B.get_b   # => 2

p class B1 < B; end

puts B1.get_b  # => 1
puts B1.set_b 3
puts B1.get_b   # => 3

puts B.get_b    # => 2

# То есть при каждом наследовании от класса, в котором была объявлена такая переменная 
# будет создаваться новая независимая.

# Accessors


# Такие переменные с помощью акцессоров создаются следующим образом:

puts '_' * 100

class A
  class << self
    attr_accessor :a
  end
  # Вместо этого такая строка: self.class.attr_accessor :a
  # невозможна только потому, что attr_accessor это private method :(
end

puts A.instance_variables # => ["@a"]
puts A.class_variables    # => []
puts A.a   # => nil

puts A.a = 123
puts A.a   # => 123
