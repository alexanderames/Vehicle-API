Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'login', to: 'access_tokens#create'
  delete 'logout', to: 'access_tokens#destroy'
  resources :vehicles do
    resources :makes, only: [:index, :create]
    resources :options, only: [:index, :create]
    resources :models, only: [:index, :create]
  end
end
