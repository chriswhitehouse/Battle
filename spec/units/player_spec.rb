# frozen_string_literal: true

describe Player do
  let(:player_one) { Player.new("Player 1") }
  let(:player_two) { Player.new("Player 2") }

  describe "#name" do
    it "should return name" do
      expect(player_one.name).to eq "Player 1"
    end
  end

  describe "#hp" do
    it "should return HP" do
      expect(player_one.hp).to eq described_class::DEFAULT_HP
    end
  end

  describe "#receive_damage" do
    it "reduce the player HP" do
      expect { player_one.receive_damage }.to change { player_one.hp }.by(-described_class::REDUCE_HP)
    end
  end
end
