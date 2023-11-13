# Методы класса

=begin
Когда вы начинаете решать большие задачи, организация является ключевым моментом. Вам не нужны 100 различных методов
и переменных, которые выполняют дублирующие друг друга действия. Если вы пытаетесь отслеживать данные (например, кучу
плохих парней в создаваемой игре), вы хотите сделать это наиболее организованным образом, чтобы можно было повторно
использовать методы и обновлять данные только в одном месте за один раз.

Классы призваны облегчить вам жизнь в этом направлении.

Мы уже говорили о хранении данных в хэшах, но как быть, если нужно рассматривать эти данные как реальный объект и
заставить их двигаться? Или если нужно обработать 10 000 различных экземпляров данных? Когда вы просто храните имя,
возраст, здоровье и силу вашего викинга, он просто сидит на месте. А если вы хотите создать целую армию викингов,
которые могут делать такие вещи, как #есть, #путешествовать, #спать и, конечно, #атаковать? Для этого вам понадобится
несколько более сложная структура, из которой вы сможете сделать своего викинга, поэтому вы создаете для него собственный
класс Viking:

=end

# class Viking
#   # пишем методы и переменные
# end

=begin
Мы имеем дело с классами с самого начала, когда стало ясно, что все в Ruby - это объекты, будь то строки, хэши,
массивы или числа, и эти объекты являются экземплярами того или иного класса.
=end

puts 1.class
puts [].class
puts '-' * 100
=begin
Подобно тому, как принадлежность к Array дает [1,2,3] метод #each, можно создавать собственные классы, которые
 также имеют доступ к общим методам.

Чтобы собрать орду из 100 викингов, необходимо создать новых. Каждый раз, когда вы это делаете, это называется
инстанцированием нового викинга. Для этого используется специальный метод ::new. Вы уже делали это много раз
для класса Array:
=end

my_arr = Array.new
p my_arr

=begin
::new - это метод класса, что означает, что вы вызываете его на классе (здесь - Array), а не на конкретном экземпляре
этого класса (здесь - my_arr). Именно поэтому мы обозначаем его двумя двоеточиями ::, когда говорим о нем здесь.
Когда вы вызываете этот метод, он создает новый экземпляр класса, а затем запускает специальный метод класса,
называемый #initialize, который устанавливает класс в состояние готовности к использованию. Если при создании
класса с помощью метода ::new вы передали в него переменные, они будут доступны методу #initialize. Ваш класс
Viking будет выглядеть следующим образом:
=end
# class Viking
#   # пишем методы и переменные
#   def initialize
#     # настраиваем викинга
#   end
# end

=begin
Классы обмениваются своими методами, но как быть с переменными? Вы же не хотите, чтобы
все ваши викинги имели одинаковую силу, поэтому для решения этой проблемы мы используем переменные экземпляра.
Вы обозначаете переменную экземпляра с помощью нотации @variable_name и можете использовать ее одинаково для
всех экземпляров викингов, но для каждого из них она будет иметь уникальное значение. Эти переменные экземпляра
являются частью настройки состояния объекта. Когда экземпляр уничтожается, доступ к переменным экземпляра также
теряется. Обычно они задаются в методе #initialize:
=end

# class Viking
#   def initialize(name, age, health, strength)
#       @name = name
#       @age = age
#       @health = health
#       @strength = strength
#   end
# end

# odin = Viking.new('Odin', 60, 100, 15)
# p odin

=begin
Обратите внимание, что имя класса всегда пишется с заглавной буквы, а для многозначных слов используется
CamelCase (заглавная буква без пробелов), а не snake_case (строчная буква с пробелами в виде подчеркиваний),
как это обычно бывает для переменных.

odin = Viking.new('Odin', 60, 100, 15)
p odin - выведет в терминале: #<Viking:0x0000028b6bde5190 @name="Odin", @age=60, @health=100, @strength=15>
Что такое Viking:0x0000028b6bde5190? - позиция в памяти компьютера, в которой хранится объект viking
=end


class Viking

  attr_accessor :name, :age, :health, :strength

  def take_damage(damage)
    self.health -= damage
    # ИЛИ мы могли бы сказать @health -= damage
    self.shout("OUCH!")
  end

  def shout(str)
    puts str
  end

  def initialize(name, age, health, strength)
      @name = name
      @age = age
      @health = health
      @strength = strength
  end

  def attack(enemy)
    puts "Attack, #{enemy}!!!"
  end

  def drinning
    puts 'Бухаю!!!'
  end

  # def health
  #   @health
  # end

  # def health2=(new_healt)
  #   @health = new_healt
  # end

end

tor = Viking.new('Tor', 120, 100000, 200)
odin = Viking.new('Odin', 75, 1000, 80)
locky = Viking.new('Locky', 35, 500, 320)
p tor
p odin
puts tor.drinning
puts '-' * 100
tor.attack('Locky')
p locky.health
locky.take_damage(320)
=begin
У нас теперь есть три викинга и  мы можем отправить одного в атаку на другого. По идее, с каждой атакой здоровье у
другого викинга должно убавляться, но если мы попробуем запустить следующий код для проверки здоровья, то мы 
получим ошибку.

locky.health - undefined method `health' for #<Viking:0x0000016e8b4e44e0 @name="Locky", @age=35,.....

Woah! Переменные экземпляра являются частью locky, но вы не можете получить к ним доступ извне, поскольку это
не касается никого, кроме него. Поэтому необходимо создать метод, специально предназначенный для получения
этой переменной, называемый методом getter, и назвать его так же, как и нужную переменную:

def health
    @health
  end

Это было просто! А если вы решите, что хотите сами установить эту переменную? Нужно создать метод setter,
который по синтаксису похож на getter, но со знаком равенства и принимающий аргумент:

def health=(new_health)
    @health = new_health
end

Вы можете себе представить, что вам, вероятно, придется написать множество таких методов,
поэтому Ruby предоставляет вам вспомогательный метод attr_accessor, который создаст эти геттеры и сеттеры за вас.
Просто передайте ему символы переменных, которые вы хотите сделать доступными, и POOF! эти методы уже существуют для
использования:

class Viking
    attr_accessor :name, :age, :health, :strength
    # codecodecode
end

attr_accessor не является магическим, он просто использует способность Ruby создавать методы изнутри вашего
скрипта (часть "метапрограммирования") для установки #name и #name=(new_name), #age и #age=(new_age) и т.д.

Не следует делать что-либо доступным для чтения и, тем более, для записи без веской причины.
Если вам нужно только одно или другое, Ruby предоставляет вам аналогичные методы attr_reader и attr_writer.
Они должны быть достаточно понятны.

=end

p tor.health
puts '.' * 120

=begin
Благодаря геттерам и сеттерам существует два различных способа доступа к переменной экземпляра изнутри класса:
либо обычный вызов с помощью @age, либо вызов метода на экземпляре с помощью self, о котором мы узнали ранее.
Ранее мы говорили, что она представляет собой объект, вызывающий определенный метод. Поскольку исходный метод
(ниже это #take_damage) вызывается на экземпляре класса, то этот экземпляр становится self. Пример более понятен:

class Viking
    ...
    def take_damage(damage)
        self.health -= damage
        # ИЛИ мы могли бы сказать @health -= damage
        self.shout("OUCH!")
    end
    def shout(str)
        puts str
    end
    ...
end


Вы также можете вызывать методы изнутри других методов, как мы видели на примере #shout выше.
В этом случае self фактически необязателен, поскольку Ruby предполагает, что если вы просто напечатаете shout("OUCH!"),
то вы пытаетесь запустить метод #shout, и Ruby проверит, существует ли этот метод. Это работает в 90% случаев, если
только вы не сделали что-то, что отменяет предположение Ruby о том, что вы пытаетесь запустить метод, например,
использовали оператор присваивания =:

def sleep
    health += 1 unless health >= 99   # ! FAIL !
  end

Здесь Ruby предполагает, что вы пытаетесь установить новую переменную здоровья, используя #health=, вместо того чтобы
обращаться к существующей в данный момент @health. Это просто крайний случай, на который следует обратить внимание,
если вы начнете устранять свои "я".

Давайте на секунду отвлечемся от уровня экземпляров и вернемся к уровню классов. Точно так же, как у вас есть
переменные экземпляра и методы экземпляра, у вас есть переменные класса и методы класса. Переменные класса,
обозначаемые ДВУМЯ символами @@, принадлежат самому классу, поэтому их всего одна, а не одна на экземпляр.

=end

# В этом примере мы предполагаем, что все викинги начинают с одинаковым здоровьем, поэтому не делаем
# его параметром, который можно передать:

# class Viking2

#   @@starting_health

#   def initialize(name, age, strength)
#       @health2 = @@starting_health
#       # ...other stuff
#   end

# end

=begin
Что касается методов класса? Вы определяете метод класса, предваряя его имя символом self
(например, def self.class_method) или, что то же самое, просто именем класса (например, def Viking.class_method).
 Существует и менее распространенный способ, при котором перед определением метода ставится строка class << self
 (при этом self больше не используется).

Использовать методы класса целесообразно в двух случаях: при создании новых экземпляров класса с кучей известных
или "предустановленных" функций и при создании какого-либо полезного метода, который должен быть идентичен для всех
экземпляров и не должен напрямую обращаться к переменным экземпляра.

Первый случай называется фабричным методом и предназначен для того, чтобы избавить вас от необходимости передавать
кучу параметров вручную в метод #initialize:

=end

class Viking2

  def initialize(name, health, age, strength)
    @name = name
    @health = health
    @age = age
    @strength = strength
  end

  def self.random_name      # useful for making new warriors!
    ['Denis', 'Tor', 'Odin', 'Helga', 'Jessica', 'Sponge Bob'].sample
  end

  def self.silver_to_gold(silver_pieces)
    silver_pieces / 10
  end

  class << self # The less common way
    def gold_to_silver(gold_pieces)
      gold_pieces * 10
    end
  end

  def self.create_warrior(name)
    age = (rand * 20 + 15).to_int # remember, rand gives a random 0 to 1
    health = [age * 5, 120].min
    strength = [age / 2, 10].min
    Viking2.new(name, health, age, strength)  # returned
  end
end

v1 = Viking2.create_warrior(Viking2.random_name)
v2 = Viking2.create_warrior(Viking2.random_name)
v3 = Viking2.create_warrior(Viking2.random_name)
v4 = Viking2.create_warrior(Viking2.random_name)
p v1
p v2
p v3
p v4
puts '.' * 120

=begin
Краткие основы

Классы удобно использовать, когда вы хотите предоставить методы своим данным или иметь несколько экземпляров данных.

Методы класса имеют доступ к другим методам класса и переменным класса, но не имеют доступа к методам
экземпляра или переменным экземпляра

Методы экземпляра могут вызывать другие методы экземпляра, переменные экземпляра, методы класса или переменные класса

=end

=begin
Если вы думаете, что переменные класса похожи на константы, то они похожи только тем, что все экземпляры имеют к
ним доступ. Если у вас есть что-то, что никогда и НИКОГДА не изменится, используйте константу. Если вы можете
когда-нибудь изменить его, используйте переменную класса. По крайней мере, это сделает ваш код гораздо
более разборчивым.

Ранее мы уже узнали о модулях - красивых пакетах методов, которые можно добавлять в классы. Но если вы часто создаете
класс, чтобы он мог использовать методы, в чем разница? В принципе, класс можно инстанцировать, а модуль - нет.
Модуль никогда не будет ничем иным, кроме как библиотекой методов. Класс может быть намного больше - он может
хранить свое состояние (отслеживая переменные экземпляра) и дублироваться сколько угодно раз. Все дело в объектах.
Если вам нужно что-то инстанцировать или иным образом заставить это существовать во времени, то именно тогда вам
нужно использовать класс, а не модуль.

Важный вопрос для размышления:

Если бы хэш (хорошее хранилище данных) и модуль (хорошие методы) завели ребенка, был бы это класс (объект с методами)?

=end