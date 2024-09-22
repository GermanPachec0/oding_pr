class Player
  attr_accessor :name, :instance_number, :symbol

  @@instance_number = 0
  def initialize(name)
    @name = name
    @symbol = @@instance_number.zero? ? 'O' : 'X'
    @instance_number = @@instance_number
    @@instance_number += 1
  end
end
