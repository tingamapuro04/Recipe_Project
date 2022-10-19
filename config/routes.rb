Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  # root "public_recipes#index"
  resources :users, only: [:index] do
    resources :recipes
    resources :inventories
  end
  
  resources :public_recipes, only: [:index, :show]
  resources :foods, only:[:index,:new,:create,:destroy]

  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
end
