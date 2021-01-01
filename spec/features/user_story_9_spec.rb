feature "9. So I can Lose a game of Battle," do
  scenario "I want to see a 'Lose' message if I reach 0HP first" do
    sign_in_and_play
    10.times do
      click_button "Attack"
      click_button "OK"
    end
    click_button "Attack"
    expect(page).not_to have_content "sinatra"
    expect(page).to have_content "Player 2 loses!"
  end
end
