RSpec.feature 'Users can add players' do

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
