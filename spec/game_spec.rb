# frozen_string_literal: true

require './lib/player.rb'
require 'game'

describe Game do
  let(:player_1_double) { double :player }
  let(:player_2_double) { double :player }
  let(:game) { described_class.new(player_1_double, player_2_double) }

  # it "accepts two arg" do
  #   expect(game).to be_instance_of described_class
  # end
  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq player_1_double
    end
  end

  describe '#player_2' do
    it 'retrieves the second player' do
      expect(game.player_2).to eq player_2_double
    end
  end

  describe '#Attack' do
    it 'damages the player' do
      expect(player_2_double).to receive(:receive_damage)
      game.attack(player_2_double)
    end
  end
end
