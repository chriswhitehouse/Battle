class Player
  attr_reader :name, :hp
  REDUCE_HP = 10
  DEFAULT_HP = 60

  def initialize(name)
    @name = name
    @hp = DEFAULT_HP
  end

  def attack(player)
    player.receive_damage
  end

  def receive_damage
    @hp -= REDUCE_HP
  end
end
