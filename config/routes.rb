Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cats, only: [:index, :show, :new, :create, :edit, :update]

  resources :cat_rental_requests, only: [:new, :create] do
    member do
      post 'approve'
      post 'deny'
    end
  end

  resources :users, only: %i(new create show)

  resources :sessions, only: %i(new create destroy)

  root to: 'cats#index'
end
