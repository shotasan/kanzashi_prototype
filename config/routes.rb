Rails.application.routes.draw do
  devise_scope :user do
    root to: "devise/sessions#new"
    get "users/sign_out", to: "devise/sessions#destroy"
  end

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  resources :users, only: %i[show]
  resources :beans do
    post :confirm, action: :confirm_new, on: :new
  end
  resources :my_blends do
    post :confirm, action: :confirm_new, on: :new
    resources :comments
  end
  resources :favorite_beans, only: %i[index create destroy]
  resources :favorite_blends, only: %i[index create destroy]
end
