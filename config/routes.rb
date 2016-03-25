Rails.application.routes.draw do
  root to: 'home#index'
  resources :manufacturers, only: :index do
    resources :models, only: :index
  end

  get 'models', to: redirect { |params, request|
    (manufacturer_id = request.params[:manufacturer_id]) ? "manufacturers/#{manufacturer_id}/models" : '/'
  }
end
