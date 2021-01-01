# frozen_string_literal: true

feature "6. So I can see how close I am to losing," do
  scenario "I want to see my own hit points" do
    sign_in_and_play
    expect(page).to have_content "Player 1"
    expect(page).to have_content "60HP"
  end
end
