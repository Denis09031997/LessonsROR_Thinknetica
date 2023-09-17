require_relative 'car'
require_relative 'truck'
require_relative 'sport_car'

truck = Truck.new
p truck.start_engine

lambo = SportCar.new
p lambo.start_engine