Rails.application.routes.draw do
  root "beans#index"

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :users, only: %i[show]
  resources :beans do
    post :confirm, action: :confirm_new, on: :new
  end
  resources :my_blends do
    resources :comments
  end
  resources :favorite_beans, only: %i[index create destroy]
  resources :favorite_blends, only: %i[index create destroy]
end
