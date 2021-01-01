# frozen_string_literal: true

feature "2. So I can see how close I am to winning," do
  scenario "I want to see Player 2's Hit Points" do
    sign_in_and_play
    expect(page).to have_content "Player 2"
    expect(page).to have_content "60HP"
  end
end
