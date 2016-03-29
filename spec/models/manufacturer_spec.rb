require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  describe 'when creating two manufacturers with the same name' do
    let!(:manufacturer_one) { FactoryGirl.create(:manufacturer, name: 'identical') }
    let!(:manufacturer_two) { FactoryGirl.build(:manufacturer, name: 'identical') }

    it 'does not allow' do
      expect(manufacturer_two).not_to be_valid
    end
  end

  describe 'when creating two manufacturers with the same webmotors id' do
    let!(:manufacturer_one) { FactoryGirl.create(:manufacturer, webmotors_id: 2) }
    let!(:manufacturer_two) { FactoryGirl.build(:manufacturer, webmotors_id: 2) }

    it 'does not allow' do
      expect(manufacturer_two).not_to be_valid
    end
  end

  it 'requires a name' do
    expect(FactoryGirl.build(:manufacturer, name: nil)).not_to be_valid
  end

  it 'requires a webmotors_id' do
    expect(FactoryGirl.build(:manufacturer, webmotors_id: nil)).not_to be_valid
  end

  describe '.default_scope' do
    let!(:manufacturer_one) { FactoryGirl.create(:manufacturer, name: 'BBB') }
    let!(:manufacturer_two) { FactoryGirl.create(:manufacturer, name: 'AAAA') }

    it 'orders by ascending name' do
      expect(Manufacturer.all).to eq [manufacturer_two, manufacturer_one]
    end
  end
end
