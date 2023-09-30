require_relative 'car'

class Truck < Car
  def loading
    
  end

  protected

  def initial_rpm # переопределние метода
    500
  end
end

scania = Truck.new
p scania.start_engine