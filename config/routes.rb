Rails.application.routes.draw do
  get 'home/show'

    devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
    resources :posts
    root 'posts#index'
end
