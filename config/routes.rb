Rails.application.routes.draw do
  get 'users/show'
  resources :users, only: [:show]

  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
