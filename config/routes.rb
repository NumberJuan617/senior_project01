Rails.application.routes.draw do

\
  root 'main_static_pages#home'
  #main static pages controller routes
  get 'about' => 'main_static_pages#about'
  get 'contact' => 'main_static_pages#contact'
  get 'home' => 'main_static_pages#home'
  get 'recipe' => 'main_static_pages#recipe'
  get 'contact' => 'main_static_pages#contact'
  get 'resources' => 'main_static_pages#resources'
  #user controller routes
  get 'signup' => 'users#new'
  #session controller routes....login sends a GET and POST request 
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  #resources utilized ith user model. 
  resources :users
end
