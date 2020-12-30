# frozen_string_literal: true

class Player
  attr_reader :name, :hp
  REDUCE_HP = 10
  DEFAULT_HP = 60

  def initialize(name)
    @name = name
    @hp = DEFAULT_HP
  end

  def receive_damage
    @hp -= REDUCE_HP
  end
end
