Rails.application.routes.draw do

  resources :posts do
    collection do
      get 'search'
    end
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  #get 'reservations/new'
  #get 'reservations/show'
  get 'pusts/index'
  get 'users/index'
  get 'posts/index'
  get "users/show" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts, param: :id
  resources :users#, only: :show
  post 'posts/new'

  resources :posts do
    resources :reservations
  end

  post 'reservations/back'
  post 'reservations/complete'

end
