RSpec.describe Player, type: :model do
  subject(:player) { Player.new(nickname: nickname,first_name: first_name, last_name: last_name) }

  let(:nickname) { 'JoeThePlayer'}
  let(:first_name) { 'Joey' }
  let(:last_name) { 'ThePlayer' }

  let(:away_player) { create(:player) }
  let(:home_player) { create(:player) }
  let(:third_player) { create(:player) }

  let!(:match) { create(:match, home_player_id: home_player.id, home_score: 10,
                        away_score: 6, away_player_id: away_player.id  ) }


  it { expect(player).to be_valid }

  describe "#first_name" do
    context 'when first_name is not present' do
      let(:first_name) { '' }

      it { is_expected.to_not be_valid }
    end
  end

  describe "#last_name" do
    context "when last_name is not present" do
      let(:last_name) { '' }

      it { is_expected.to_not be_valid }
    end
  end

  describe "#nickname" do
    context "when nickname is not present" do
      let(:nickname) { '' }

      it { is_expected.to_not be_valid }
    end

    context 'when nickname is not unique' do
      let!(:first_player) { Player.create!( nickname: 'AwesomeJoe',
                                        first_name: 'Joey', last_name: 'TheAwesome')}
      let(:duplicate_player) { first_player.dup}

      it { expect(duplicate_player).not_to be_valid }
    end
  end

  describe "#number_of_matches" do
    context 'after one played match' do
      it { expect(home_player.number_of_matches).to eq 1 }
      it { expect(away_player.number_of_matches).to eq 1 }
      it { expect(home_player.rating).to_not eq 0.0 }
    end

    context 'when home player play one more game' do
      let!(:second_match) { create(:match, home_player_id: home_player.id, home_score: 10,
                        away_score: 9, away_player_id: third_player.id  ) }

      it { expect(home_player.number_of_matches).to eq 2 }
      it { expect(away_player.number_of_matches).to eq 1 }
      it { expect(third_player.number_of_matches).to eq 1 }
    end
  end

  describe "#wins and #goals" do
    context 'when home player won one time' do
      it { expect(home_player.wins).to eq 1 }
      it { expect(home_player.goals).to eq 10 }
      it { expect(home_player.lost_goals).to eq 6 }
    end

    context 'when away player lose' do
      it { expect(away_player.wins).to eq 0 }
      it { expect(away_player.goals).to eq 6 }
    end

    context 'when away home player win one more game' do
      let!(:second_match) { create(:match, home_player_id: home_player.id, home_score: 10,
                  away_score: 9, away_player_id: third_player.id  ) }

      it { expect(home_player.wins).to eq 2 }
      it { expect(home_player.goals).to eq 20 }
      it { expect(home_player.lost_goals).to eq 15}
    end
  end

    describe "#lose and #lost_goals" do
    context 'when home player not lose' do
      it { expect(home_player.lose).to eq 0 }
    end

    context 'when away player lose' do
      it { expect(away_player.lose).to eq 1 }
    end

    context 'when away home player win one more game' do
      let!(:second_match) { create(:match, home_player_id: home_player.id, home_score: 10,
                  away_score: 9, away_player_id: third_player.id  ) }

      it { expect(third_player.lose).to eq 1 }
      it { expect(home_player.lose).to eq 0 }
    end
  end
end
