Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root_path :cocktails_path
  root to: "cocktails#index"
  resources :cocktails do
  # references :cocktail
  resources :doses, only: [:new, :create]
end
resources :doses, only: :destroy
end
