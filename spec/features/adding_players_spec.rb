RSpec.feature 'Users can add players' do
  let!(:user) { create(:user) }

  context "not logged in users" do
    scenario 'cannot see the New Player link' do
      visit '/'

      expect(page).to_not have_content "New Player"
    end
  end

  context "loggen in users can add players" do
    before { login(user) }

    scenario 'with valid attributes' do
      visit "/"

      click_link 'New Player'

      fill_in "Nickname", with: "JoeMaster"
      fill_in "First Name", with: "Joey"
      fill_in 'Last Name', with: 'ThePlayer'
      attach_file "Avatar", "spec/fixtures/avatar.png"

      click_button 'Add Player'

      expect(page).to have_content "Player has been successfully added"

      within("#player .avatar") do
        expect(page).to have_css("img[alt=joemaster]")
      end
    end
  end
end
