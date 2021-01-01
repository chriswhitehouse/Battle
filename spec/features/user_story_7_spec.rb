# frozen_string_literal: true

feature "7. So I can lose a game of Battle," do
  scenario "I want Player 2 to attack me, and I want to get a confirmation" do
    sign_in_and_play
    click_button "Attack"
    click_link "OK"
    click_button "Attack"
    expect(page).to have_content "Player 2 attacked Player 1\nOK"
  end
end
