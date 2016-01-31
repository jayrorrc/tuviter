Rails.application.routes.draw do
  resources :friendships
    devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

    resources :posts
    get '/posts/new', to: 'posts#new', as: 'post_new'
    get '/posts', to: 'posts#index', as: 'post_all'
    
    resources :users
    get '/perfil/:id', to: 'users#show', as: 'user_perfil'
    get '/perfil/edit/:id', to: 'users#edit', as: 'user_edit'

    root 'home#show'
end
