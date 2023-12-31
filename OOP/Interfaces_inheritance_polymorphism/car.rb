# Интерфейсы, наследование и полиморфизм


=begin

Допустим у нас должен быть метод start_engine (запустить двигатель). Прежде чем начинать писать какой-либо код - его
нужно сформулировать для себя на естественном языке в терминах тех объектов и тех действий, которые он выполняет.

Можно сначала записывать действия в виде комментариев, а потом уже переводить их в програмный код. Т.е когда мы
проектируем класс мы поначалу можем просто комментариями записать те дейстивия, те методы, которые у нас должны быть. 
А далее мы поочередно начинаем их реализовывать.

Код в идеале должен быть самодокументируемый - читая его, даже пользователь не знакомый с языком программирования (ЯП)
должен понимать что там происходит.

Сначала написать код на естественном языке - как нам запустить двигатель? Мы должны запустить двигатель, если он не 
запущен. Такой подход, когда мы сначала пишем комментарий, а потом код - называют еще ментальным программированием,
когда мы код пишем в уме (на бумажке, блок схемы).

Метод снаружи внутрь - можем сразу использовать некие методы/конструкции, вызывать их даже если мы их еще не написали.
Это тоже один из хороших подходов. Т.е сначала пишем очевидные методы, таким образом, каким хотели бы их видеть.

Инкапсуляция - сокрытие деталей реализации. Т.е у пользователя не должно быть доступа к внутренней логике.

Изменение кода, без изменения функциональности называется - рефакторинг.

Как определить должен ли метод быть приватным или публичным? Нужно задать себе вопрос: Метод будет вызываться из клиентского кода?
Если нет - то помещаем в privat.

НАСЛЕДОВАНИЕ - позволяет наследовать методы, свойства и тд. Мы должны избегать дублирование кода.
Придерживаться принципа "Не повторяйся".

ПОЛИМОЗФИЗМ - переопределние поведения в подклассах.

Protected - почти тоже самое что и private, только методы которые защищены protected доступны в подклассах.
Если мы переопределяем метод, то он должен быть в тойже области видимости, что и был в базовом классе. Мы не можем
взять публичный метод и перенсти его в protected или private. 
=end

class Car

  # attr_accessor :current_rpm - нужно записать в private и изменить на "attr_writer", т.к можно измеенить через клиентский код: car.current_rpm = 1000
  attr_reader :current_rpm

  def initialize
    @current_rpm = 0
  end
  # завести двигатель
  def start_engine
    # запустить двигатель если он не запущен
    start_engine! if engine_stopped? # ! - этот метод изменяет самого объекта, без знака этот метод  зациклиться и будет вызывать сам себя
  end


  def engine_stopped?
    # True, если обороты на нуле
    current_rpm.zero?
  end

  protected # private - меняем на protected # Все методы которые идут после него будут доступны внутри класса, но извне не доступны будут

  attr_writer :current_rpm

  # INITIAL_RPM = 700 - меняем её на метод, чтобы могли применять полиморфиз (переопределение в подклассах), т.к менять константу это идеологически неверно

  def initial_rpm
    700
  end

  def start_engine!
    # устанавливает начальные обороты
    self.current_rpm = initial_rpm # INITIAL_RPM - вместо константы используем метод # 700 # без self не установит обороты. 700 - Магическое число - не понятно, что означает. Сделаем его константой, в константе изменять значения нельзя
  end
  # остановить двигатель
end

# p car.start_engine! # Опять запускаем двигатель, не смотря на то, что уже запущен. Поэтому добавим private


class Driver
  def drive(car)
    # Сесть в машину
    # запустить двигатель
    car.start_engine
    # тронуться с места
  end
end
