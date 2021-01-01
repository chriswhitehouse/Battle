feature "8. So I can start to lose a game of Battle," do
  scenario "I want Player 2's attack to reduce my HP by 10" do
    sign_in_and_play
    click_button "Attack"
    click_link "OK"
    click_button "Attack"
    click_link "OK"
    expect(page).to have_content "Player 1"
    expect(page).to have_content "50HP"
  end
end
