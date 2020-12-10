feature Battle do
  # scenario 'Displays a confirmation message' do
  #   visit '/'
  #   expect(page).to have_content 'Testing infrastructure working!'
  # end

  scenario 'see players names renders on screen' do
    visit '/'
    fill_in 'player_1_name', with: "Chris W"
    fill_in 'player_2_name', with: "Chris A"
    click_button "Submit"
    expect(page).to have_content "Chris W vs. Chris A"
  end

  scenario 'Player 1 can see Player 2 Hit points' do
    visit '/'
    fill_in 'player_1_name', with: "Chris W"
    fill_in 'player_2_name', with: "Chris A"
    click_button "Submit"
    expect(page).to have_content "Chris A: 60HP"
  end


end
