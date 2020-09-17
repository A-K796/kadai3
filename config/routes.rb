Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books,only:[:create, :show, :edit, :update, :destroy, :index]
  
  resources :users,only:[:show, :edit, :update, :index]
  get 'home/about'
  root 'home#top'
end

