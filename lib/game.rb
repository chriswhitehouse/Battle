# frozen_string_literal: true

class Game
  def self.play(player_1, player_2)
    @game = new(player_1, player_2)
  end

  def self.instance
    @game
  end

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def player_1
    players.first
  end

  def player_2
    players.last
  end

  def current_turn
    @current_turn
  end

  def switch_turns
    @current_turn = opponent
  end

  def opponent
    players.select { |player| player != @current_turn }.first
  end

  def game_over?
    losing_players.any?
  end

  def loser
    losing_players.first
  end

  private

  def losing_players
    players.select { |player| player.hp <= 0 }
  end

  attr_reader :players
end
