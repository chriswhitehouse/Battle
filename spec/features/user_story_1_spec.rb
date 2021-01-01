# frozen_string_literal: true

feature "1. So we can play a personalised game of Battle," do
  scenario "We want to Start a fight by entering our Names and seeing them" do
    sign_in_and_play
    expect(page).to have_content "Player 1 vs. Player 2"
  end
end
