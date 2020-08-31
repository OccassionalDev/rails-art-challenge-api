Rails.application.routes.draw do
  defaults format: :json do 
    scope '/api/v:api_version' do
      resources :cakes
      resources :users
    end

    resources :users
  end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
