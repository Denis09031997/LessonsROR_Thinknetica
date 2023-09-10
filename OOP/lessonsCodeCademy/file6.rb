=begin

Основы классификации
Хорошо! Давайте сделаем небольшой обзор.

=end

class Message

  @@messages_sent = 0

  def initialize(from, to)
    @from = from
    @to = to
    @@messages_sent += 1
  end
end

my_message = Message.new('Denis', 'Svetlana')

# Отлично! Теперь давайте немного попрактикуемся в наследовании.

class Email < Message
  def initialize(from, to)
    super
  end
end