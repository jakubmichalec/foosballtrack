RSpec.describe Player, type: :model do
  subject(:player) { Player.new(first_name: first_name, last_name: last_name) }

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
end
