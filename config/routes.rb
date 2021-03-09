Rails.application.routes.draw do
  get '/new', to: 'users#new', as: 'new_user'
  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#handle_login'
  
  resources :user_crushes
  resources :crushes
  resources :users
  resources :zodiacs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
