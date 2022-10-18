Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show] do 
    resources :recipes, only: [:index, :show] do
      resources :inventories, only: [:index, :show, :create] do
        resources :foods, only: [:index, :show, :new] do
          resources :inventory_foods, only: [:index, :create, :show] do
            resources :recipe_foods, only: [:index, :show, :create] do
            end
          end
        end
      end
    end
  end
end
