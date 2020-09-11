Rails.application.routes.draw do
  defaults format: :json do 
    scope '/api/v:api_version' do
      resources :cakes
      resources :users, only: [:index, :show, :create]

      # Logins
      post '/login' => 'sessions#create'
      delete '/logout' => 'sessions#destroy'
    end

    resources :users, only: [:index, :show, :create]

    # Logins
    post '/login' => 'sessions#create'
    delete '/logout' => 'sessions#destroy'
  end 
end
