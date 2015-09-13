RSpec.feature 'Users can view Players page' do
  let!(:player) { create(:player) }
  let!(:user) { create(:user) }

  scenario 'with basic informations' do
    login(user)
    visit '/'

    click_link "#{player.full_name}"

    expect(page.current_url).to eq player_url(player)
  end
end
