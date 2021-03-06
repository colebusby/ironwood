Ironwood::Application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'home', to: 'home#index'

  #users
  resources :users, only: [:show] do
    collection do
      patch 'update_password'
    end
  end
  resources :residents
  devise_scope :user do
    match "sign_out", :to => "devise/sessions#destroy", via: [:delete]
  end

  #CC&R
  get 'by_laws', to: 'by_laws#index'
  get 'policies', to: 'policies#index'
  get 'swimming', to: 'swimming#index'
  get 'parking', to: 'parking#index'
  get 'pets', to: 'pets#index'
  get 'hoa_dues', to: 'hoa_dues#index'

  #Contacts
  get 'contacts', to: 'contacts#index'
  post 'send_question', to: 'contacts#send_question'

  #Homeowners
  resources :board_meeting_minutes, only: [:index, :create, :destroy]
  resources :homeowners, only: [:index]
  resources :budgets, only: [:index, :create, :destroy]

  #FAQ
  resources :faqs, only: [:index]
  resources :pictures, only: [:index, :create]
  get 'upkeep', to: 'upkeep#index'

end
