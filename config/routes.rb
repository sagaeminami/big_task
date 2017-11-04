Rails.application.routes.draw do
  get '/',  to:'clones#index'
  patch '/clones/:id' => 'clones#update'
  resources :favorites,only: [:create,:destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :clones do
    collection do
    get  'favorite'
    post 'confirm'
    end
  end
end
