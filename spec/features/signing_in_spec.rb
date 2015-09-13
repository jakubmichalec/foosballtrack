RSpec.feature 'Users can sign up' do
  scenario 'with valid attributes' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'example@example.com'
    fill_in 'user_password', with: 'passw0rd'
    fill_in 'Password confirmation', with: 'passw0rd'

    click_button 'Sign up'
    expect(page).to have_content "Welcome aboard! Enjoy foosball!"
  end
end
