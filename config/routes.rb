Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  #すべてのアクションにルーティング設定
  resources :items do
    resources :orders, only: [:index, :create ]
  end
end
