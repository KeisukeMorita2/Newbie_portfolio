# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'questions#index'
  resources :users, only: %i[index show new create destroy edit update] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  resources :sessions, only: %i[new create destroy]
  resources :questions, only: %i[create destroy index new show edit update]
  resources :relationships, only: %i[create destroy]
  resources :favorites, only: %i[create destroy]
end
