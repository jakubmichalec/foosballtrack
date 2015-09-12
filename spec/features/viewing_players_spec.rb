RSpec.feature 'Users can view Players page' do
  let!(:player) { create(:player) }

  scenario 'with basic informations' do
    visit '/'

    click_link "Joey ThePlayer"

    expect(page.current_url).to eq player_url(player)
  end
end
