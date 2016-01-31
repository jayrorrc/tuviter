Rails.application.routes.draw do
    devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

    resources :posts
    get '/posts/new', to: 'patients#new', as: 'post_new'
    get '/posts', to: 'patients#index', as: 'post_all'

    root 'home#show'
end
