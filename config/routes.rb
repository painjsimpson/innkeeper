Rails.application.routes.draw do
  root to: "pages#show", defaults: {id: '1'} 
  resources :menus
  resources :pages
  resources :settings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
