# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      namespace :user do
        post 'sign_up', to: 'sessions#sign_up'
        post 'sign_in', to: 'sessions#sign_in'
        delete 'sign_out', to: 'sessions#sign_out'
        get 'me', to: 'sessions#me'
        post 'users/confirm', to: 'sessions#confirm'
      end
      get 'projects', to: 'projects#index'
      post 'projects', to: 'projects#create'
      post 'user_projects', to: 'user_projects#create'
    end
  end
end
