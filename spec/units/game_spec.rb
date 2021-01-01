# frozen_string_literal: true

require "./lib/player.rb"
require "game"

describe Game do
  let(:player_1_double) { double :player_1 }
  let(:player_2_double) { double :player_2 }
  let(:game) { described_class.new(player_1_double, player_2_double) }

  # it "accepts two arg" do
  #   expect(game).to be_instance_of described_class
  # end
  describe "#player_1" do
    it "returns the first player" do
      expect(game.player_1).to eq player_1_double
    end
  end

  describe "#player_2" do
    it "returns the second player" do
      expect(game.player_2).to eq player_2_double
    end
  end

  describe "#current_turn" do
    context "at the start of the game" do
      it "returns player 1" do
        expect(game.current_turn).to eq player_1_double
      end
    end
  end

  describe "#switch_turns" do
    context "after player 1 attacks" do
      it "returns player 2" do
        expect(game.switch_turns).to eq player_2_double
      end
    end
  end

  describe "#opponent" do
    it "returns opponent of current_turn" do
      expect(game.opponent).to eq player_2_double
      game.switch_turns
      expect(game.opponent).to eq player_1_double
    end
  end
end
