Rails.application.routes.draw do
  get '/reviews/mine', to: 'reviews#mine', as: :user_reviews
  resources :reviews
  resources :roasters
  resources :beans

  devise_for :users

  root to: 'home#index'
end
