Rails.application.routes.draw do
  
  devise_for :users
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :projects

  resources :issues , only: [:new, :create,:edit, :destroy ,:update]

  get 'site/index'
  
  root to: 'site#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
