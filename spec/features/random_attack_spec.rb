feature "Testing computer choosing a random attack" do
  context "Computer chooses randomly and choice shows on screen" do
    before do
      sign_in_and_play
    end
    scenario "Seeing computer's choice" do
      click_button "Rock"
      expect(page).to have_content(/Computer chose rock|Computer chose paper|Computer chose scissors/)
    end
  end
end
