RSpec.feature 'Users can add players' do

  scenario 'with valid attributes' do
    visit "/"

    click_link 'New Player'

    fill_in "First Name", with: "Joey"
    fill_in 'Last Name', with: 'ThePlayer'

    click_button 'Add Player'

    expect(page).to have_content "Player has been successfully added"
  end

end
