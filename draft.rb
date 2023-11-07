class Car
  attr_accessor :color

  def initialize(number)
    @number = number
    @color = 'white'
  end

  def beep
    puts 'beep beep'
  end
end

kia = Car.new('x101px56')
volvo = Car.new(777)
volvo.color = 'gray'
p kia
p volvo
puts kia.color
puts volvo.color