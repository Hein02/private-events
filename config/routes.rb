Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users

  root 'events#index'

  resources :events, only: %i[index new create show edit update destroy]
  resources :users, only: %i[show]
  resources :event_attendings, only: %i[create destroy]
end
