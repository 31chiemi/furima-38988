Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  #すべてのアクションにルーティング設定
end
