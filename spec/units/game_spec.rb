# frozen_string_literal: true

require "./lib/player.rb"
require "game"

describe Game do
  let(:player_1_double) { double :player_1, hp: 60 }
  let(:player_2_double) { double :player_2, hp: 60 }
  let(:dead_player_double) { double :dead_player, hp: 0 }
  let(:game) { described_class.new(player_1_double, player_2_double) }
  let(:finished_game) { described_class.new(dead_player_double, player_2_double) }
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

  describe "#game_over?" do
    it "returns false if no-one is at 0HP" do
      expect(game.game_over?).to be false
    end

    it "returns true if at least one player is at 0HP" do
      expect(finished_game.game_over?).to be true
    end
  end

  describe "#loser" do
    it "returns a player on 0HP or lower" do
      expect(finished_game.loser).to eq dead_player_double
    end
  end
end
