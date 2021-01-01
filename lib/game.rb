# frozen_string_literal: true

class Game
  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    player.receive_damage
  end

  def current_turn
    @current_turn
  end

  def switch_turns
    @current_turn = opponent
  end

  def opponent
    @players.select { |n| n != @current_turn }.first
  end
end
