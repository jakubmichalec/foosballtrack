RSpec.feature 'User authentication' do

  let!(:user) { create(:user) }

  feature 'Users can sign up' do
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

  feature 'Users can sign in' do
    scenario 'with valid attributes' do
      visit '/'
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      expect(page).to have_content "Signed in successfully"
    end
  end

  feature 'User can sign out' do
    context "if they logged in" do
      before { login(user) }

      scenario do
        visit '/'
        click_link 'Sign Out'

        expect(page).to have_content "Signed out successfully"
      end
    end
  end
end
