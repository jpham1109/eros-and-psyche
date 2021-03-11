Rails.application.routes.draw do
  # get '/new', to: 'users#new', as: 'new_user'
  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#handle_login'
  delete '/logout', to: 'users#logout'
  # get 'crushes/:id/user_crushes/new', to: 'user_crushes#new', as: 'new_user_crush'
  resources :user_crushes
  resources :crushes
  patch '/crushes/:id/friend', to: 'crushes#friend', as: 'friend'
  resources :users
  resources :zodiacs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
