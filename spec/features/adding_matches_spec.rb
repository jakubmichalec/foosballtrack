RSpec.feature 'Users can add matches' do
  subject(:match) { Match.new(match_date: match_date, home_player_id: home_player_id,
                    home_score: home_score, away_score: away_score,
                    away_player_id: away_player_id) }

  let!(:home_player) { create(:player) }
  let!(:away_player) { create(:player) }

  let(:match_date) { Date.today.to_s(:db) }
  let(:home_player_id) { home_player.id }
  let(:away_player_id) { away_player.id }
  let(:away_score) { 10 }
  let(:home_score) { 9 }

  it { expect(match).to be_valid }

  scenario 'with valid attributes' do
    visit '/'
    click_link 'New Match'

    fill_in 'Match Date', with: '2015/01/01'
    select("#{home_player.nickname}", from: 'Home Player' )
    select(10, from: 'Home Score')
    select("#{away_player.nickname}", from: 'Away Player' )
    select(9, from: 'Away Score')

    click_button 'Add Match'

    expect(page).to have_content "Match has been successfully added"
  end

  describe "#match_date" do
    context "when match date is not present" do
      let(:match_date) { '' }

      it { expect(match).to_not be_valid }
    end
  end

  describe "#home_player_id" do
    context "when home_player_id is not present" do
      let(:home_player_id) { '' }

      it { expect(match).to_not be_valid }
    end
  end

  describe "#away_player_id" do
    context "when away_player_id is not present" do
      let(:away_player_id) { '' }

      it { expect(match).to_not be_valid }
    end
  end

  describe "#home_score" do
    context "when home_score is not present" do
      let(:home_score) { '' }

      it { expect(match).to_not be_valid }
    end
  end

  describe "#away_score" do
    context "when away score is not present" do
      let(:away_score) { '' }

      it { expect(match).to_not be_valid }
    end
  end

  describe "#score" do
    context "when away player wins" do
      let!(:away_match_win) { match.dup.save!}

      it { expect(home_player.home_score_sum).to eq home_score }
      it { expect(away_player.away_score_sum). to eq away_score }
    end
  end
end
