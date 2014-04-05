Ironwood::Application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'home#index'
  get 'home', to: 'home#index'
end
