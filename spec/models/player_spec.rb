RSpec.describe Player, type: :model do
  subject(:player) { Player.new(nickname: nickname,first_name: first_name, last_name: last_name) }

  let(:nickname) { 'JoeThePlayer'}
  let(:first_name) { 'Joey' }
  let(:last_name) { 'ThePlayer' }

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
end
