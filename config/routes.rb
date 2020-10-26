Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'items/search'
  get 'likes' => 'likes#index'
  resources :users
  resources :items do
    resources :orders
    # likeのcreateとdeleteを追加
    post 'likes' => 'likes#create'
    delete '/likes' => 'likes#destroy'
    collection do
      get 'category_search'
    end
  end
end
