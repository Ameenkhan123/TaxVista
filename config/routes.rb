Rails.application.routes.draw do
  root 'home#index'
  get 'home' => 'home#index'
  get 'contact' => 'home#contact'
  get 'refer' => 'home#refer'
  
  resources :home
  devise_for :admins
  devise_for :customers
  devise_for :accountants
  resources :accounts
  namespace :admin do
    # resources :dashboard
    resources :admins
    resources :customers
    resources :accountants
    get 'dashboard' => 'dashboard#index'
  end

  namespace :customer do
    resources :accounts
    resources :customers
    resources :customer_accountants
    get 'dashboard' => 'dashboard#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
