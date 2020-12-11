describe Player do
  let(:player_one) { Player.new("Chris") }
  let(:player_two) { Player.new("Javi") }
  it "should return its name" do
    expect(player_one.name).to eq "Chris"
  end

  it "returning the HP" do
    expect(player_one.hp).to eq described_class::DEFAULT_HP
  end
  describe "#Attack" do
    it "damages the player" do
      expect(player_two).to receive(:receive_damage)
      player_one.attack(player_two)
    end
  end
  describe "#Receive_damage" do
    it "reduce the player HP" do
      expect { player_one.receive_damage }.to change { player_one.hp }.by(-described_class::REDUCE_HP)
    end
  end
end
