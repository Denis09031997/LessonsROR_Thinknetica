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

class Viking
  def initialize(name, age, health, strength)
      @name = name
      @age = age
      @health = health
      @strength = strength
  end
end

odin = Viking.new('Odin', 60, 100, 15)
p odin