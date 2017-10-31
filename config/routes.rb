Rails.application.routes.draw do
  get '/',  to:'clones#index'
  patch '/clones/:id' => 'clones#update' 
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :clones do
    collection do
    post 'confirm'
    end
  end
end
