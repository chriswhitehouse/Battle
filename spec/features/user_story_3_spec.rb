# frozen_string_literal: true

feature "3. So I can win a game of Battle," do
  scenario "I want to attack Player 2, and I want to get a confirmation" do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content "Player 1 attacked Player 2 OK"
  end
end
