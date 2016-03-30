require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    let!(:manufacturer) { FactoryGirl.create :manufacturer }

    it 'assigns @manufacturers' do
      get :index

      expect(assigns(:manufacturers)).to eq([manufacturer])
    end
  end
end
