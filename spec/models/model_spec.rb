require 'rails_helper'

RSpec.describe Model, type: :model do
  it 'requires a name' do
    expect(FactoryGirl.build(:model, name: nil)).not_to be_valid
  end

  it 'requires a manufacturer' do
    expect(FactoryGirl.build(:model, manufacturer: nil)).not_to be_valid
  end

  describe '.default_scope' do
    let!(:model_one) { FactoryGirl.create(:model, name: 'BBB') }
    let!(:model_two) { FactoryGirl.create(:model, name: 'AAAA') }

    it 'orders by ascending name' do
      expect(Model.all).to eq [model_two, model_one]
    end
  end
end
