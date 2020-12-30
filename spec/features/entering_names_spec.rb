# frozen_string_literal: true

feature Battle do
  # scenario 'Displays a confirmation message' do
  #   visit '/'
  #   expect(page).to have_content 'Testing infrastructure working!'
  # end

  scenario "see players names renders on screen" do
    sign_in_and_play
    expect(page).to have_content "Chris W vs. Chris A"
  end

  scenario "Player 1 can see Player 2 Hit points" do
    sign_in_and_play
    expect(page).to have_content "Chris A: 60HP"
  end
end
