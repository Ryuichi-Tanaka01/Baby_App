Rails.application.routes.draw do
  # トップページのルート
  root "top#index"

  # ログイン画面のルート
  get 'login', to: 'sessions#login' # ログイン画面

end
