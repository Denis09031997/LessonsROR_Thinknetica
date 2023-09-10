# ПЕРЕЙДЕМ К СОЗДАНИЮ НАШЕГО КЛАССА

class Computer
  @@users = {}

  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end

  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created at #{time} by #{@username}."
  end

  def result
    puts "Был создан файл #{@files.keys}, его создал пользователь - #{@username}."
  end

    def Computer.get_users
      return @@users
    end
end

denis = Computer.new('Denis', 'Nehwbz2019')
p denis
file1 = denis.create('Photo_Turkey2019')
puts file1
denis.result
puts '---------------------------------------------------------------------------'

=begin
Кто такие пользователи?
Отлично! Однако, если подумать, у нас может быть целая куча пользователей, создающих файлы где попало,
и у нас нет способа добраться до нашей переменной класса @@users! Придется создать метод для доступа к ней.

Поскольку @@users является переменной класса, мы будем использовать метод класса для ее получения. Большинство методов,
которые вы видели до сих пор, являются методами экземпляра - они работают с конкретным экземпляром/объектом,
таким как "matz" или "blixy". Метод класса принадлежит самому классу, и поэтому он снабжается префиксом имени класса.

class Machine
  def Machine.hello
    puts "Hello from the machine!"
  end
end

=end

my_computer = Computer.new('Sponge Bob', 'Krusty Krabs')
p my_computer
my_computer.create('secret formul')
p my_computer

