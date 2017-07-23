Rails.application.routes.draw do
  resources :patients do
    resources :encounters
  end
  root "patients#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
