Rails.application.routes.draw do
  devise_for :users
  root :to => 'top#index'
  resources :users do
    resources :id
  end

  resources :books do
    resources :id
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
