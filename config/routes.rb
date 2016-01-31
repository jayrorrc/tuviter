Rails.application.routes.draw do
  resources :friendships
    devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

    resources :posts
    get '/posts/new', to: 'posts#new', as: 'post_new'
    get '/posts', to: 'posts#index', as: 'post_all'
    
    get '/perfil/:id', to: 'users#perfil', as: 'perfil'

    root 'home#show'
end
