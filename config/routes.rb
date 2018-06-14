Rails.application.routes.draw do
  root 'home#index'
  get 'home' => 'home#index'
  get 'contact' => 'home#contact'
  get 'refer' => 'home#refer'
  get 'customer' => 'home#customer_dashboard'
  devise_for :admins
  devise_for :customers
  devise_for :accountants

  namespace :admin do
    # resources :dashboard
    resources :admins
    resources :customers
    resources :accountants
    get 'dashboard' => 'dashboard#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
