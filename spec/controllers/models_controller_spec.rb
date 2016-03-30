require 'rails_helper'

RSpec.describe ModelsController, type: :controller do
  describe 'GET #index' do
    let!(:manufacturer) { FactoryGirl.create :manufacturer }

    it 'assign @manufacturer' do
      get :index, manufacturer_id: manufacturer

      expect(assigns(:manufacturer)).to eq(manufacturer)
    end

    it 'redirects when the manufacturer_id is invalid' do
      get :index, manufacturer_id: Manufacturer.maximum(:id) + 1
      expect(response).to redirect_to(root_path)
    end
  end
end
