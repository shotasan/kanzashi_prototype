Rails.application.routes.draw do

  # ログイン、アカウント編集後、任意のページに推移させるための記述（一時的に削除中、あとで追加）
  devise_for :users

  resources :users, only: [:show]
  resources :beans
end
