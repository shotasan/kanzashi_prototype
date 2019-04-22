Rails.application.routes.draw do

  get 'favorite_beans/index'
  get 'favorite_beans/create'
  get 'favorite_beans/destroy'
  # ログイン、アカウント編集後、任意のページに推移させるための記述（一時的に削除中、あとで追加）
  devise_for :users

  resources :users, only: %i[show]
  resources :beans
  resources :favorite_beans, only: %i[index create destroy]
end
