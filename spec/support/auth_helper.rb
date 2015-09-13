module AuthHelper
  def login(user)
  visit '/'
  click_link 'Sign In'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'
  end
end


RSpec.configure do |c|
  c.include AuthHelper, type: :feature
end
