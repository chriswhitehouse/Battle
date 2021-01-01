feature "5. So we can continue our game of Battle," do
  context "We want to switch turns" do
    scenario "at the start of the game" do
      sign_in_and_play
      expect(page).to have_content "Player 1's turn"
    end

    scenario "after player 1 attacks" do
      sign_in_and_play
      click_button "Attack"
      click_link "OK"
      expect(page).not_to have_content "Player 1's turn"
      expect(page).to have_content "Player 2's turn"
    end
  end
end
