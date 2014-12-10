Rails.application.routes.draw do

  get 'users/new'

  root 'main_static_pages#home'
  get 'about' => 'main_static_pages#about'
  get 'contact' => 'main_static_pages#contact'
  get 'home' => 'main_static_pages#home'
  get 'recipe' => 'main_static_pages#recipe'
  get 'contact' => 'main_static_pages#contact'
  get 'resources' => 'main_static_pages#resources'
  get 'signup' => 'users#new'
  resources :users
end
