# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_page#home'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#method_logged_in?'
  resources :users,  only: %i[create show index] do
    resources :books do
      resources :trackings
    end
  end
end
