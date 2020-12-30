# frozen_string_literal: true

describe Player do
  let(:player_one) { Player.new("Chris") }
  let(:player_two) { Player.new("Javi") }
  it "should return its name" do
    expect(player_one.name).to eq "Chris"
  end

  it "returning the HP" do
    expect(player_one.hp).to eq described_class::DEFAULT_HP
  end

  describe "#Receive_damage" do
    it "reduce the player HP" do
      expect { player_one.receive_damage }.to change { player_one.hp }.by(-described_class::REDUCE_HP)
    end
  end
end
