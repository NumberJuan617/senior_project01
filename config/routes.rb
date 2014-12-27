Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'
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
  post   'login'   => 'sessions#create'#post command 'sends all form submition data' to the user
  delete 'logout'  => 'sessions#destroy'

  #resources utilized ith user model. This must include the users_helper helper files 
  resources :users
end


#provides GET(aquire) POST() DELETE HTTP commands which are used in hyperlinks. Imagine this as a template file 
#to all of the resources links i want use for navigation and utilization for the user. 