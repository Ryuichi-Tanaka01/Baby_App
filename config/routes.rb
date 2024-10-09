Rails.application.routes.draw do
  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"
  get "users/new"
  # トップページのルート
  root "top#index"
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :records
  # ログイン画面のルート
  get 'login', to: 'sessions#new' # ログイン画面
  post 'login', to: 'sessions#create' # ログイン画面
  get 'logout', to: 'sessions#destroy' # ログイン画面
  get 'newpassword', to: 'sessions#newpassword' # ログイン画面
  resources :users do
    get 'page', on: :collection  # ユーザーのページへのルーティング
    get 'write_create', on: :collection  # ユーザーのページへのルーティング
  end

end
