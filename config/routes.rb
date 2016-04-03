Rails.application.routes.draw do

  devise_for :users
  resources :players do
    resources :comments
  end
  resources :authors
  resources :skills
  resources :teams
  resources :leagues
  resources :positions


  
  root "players#index"
end
