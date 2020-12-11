require './lib/player.rb'
require 'game'

describe Game do
  let(:player_2_double) { double :player }
  let(:game) { described_class.new }

  describe "#Attack" do
    it "damages the player" do
      expect(player_2_double).to receive(:receive_damage)
      game.attack(player_2_double)
    end
  end
end
