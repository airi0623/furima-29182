Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users
  resources :items do
    resources :orders
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
