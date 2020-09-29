Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'items/search'
  resources :users
  resources :items do
    resources :orders
    resources :likes, only: [:create, :destroy]
    collection do
      get 'category_search'
    end
  end
  # resources :items do
  #   collection do
  #     get 'category_search'
  #   end
  # end

end
