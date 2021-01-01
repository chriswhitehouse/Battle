feature "4. So I can start to win a game of Battle," do
  scenario "I want my attack to reduce Player 2's HP by 10" do
    sign_in_and_play
    click_button "Attack"
    click_link "OK"
    expect(page).to have_content "Player 2: 50HP"
  end
end
