class SportCar < Car

  def start_engine
    super # Обходим дублирование кода при переопределнии методов родительского класса. Вызываем стандартную реализацию базового класса. Если есть аргументы, то передаем их в скобки "super()"
    puts 'Wroooom! Wroooom!'
  end

  protected

  def initial_rpm
    1000
  end
end