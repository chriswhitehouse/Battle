describe Player do
  let(:player) { Player.new('name') }
  it 'should return its name' do
    expect(player.name).to eq 'name'
  end
end
