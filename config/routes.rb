Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  root to: "hello#index"
  resource :about, only:[ :show, :edit, :update]
  resources :users 
end
