Rails.application.routes.draw do



  root 'main_static_pages#home'
  
  #main static pages controller routes
  get 'about' => 'main_static_pages#about'
  get 'contact' => 'main_static_pages#contact'
  get 'home' => 'main_static_pages#home'
  get 'contact' => 'main_static_pages#contact'
  get 'resources' => 'main_static_pages#resources'
  
  #user controller routes
  get 'signup' => 'users#new'
  get 'editUser' => 'users#edit'
  get 'userRecipes'=> 'users#recipes'
  #user edits controller routes
  get 'addProfileContent' =>'user_edits#add'
  get 'manageProfileContent' =>'user_edits#home'

  #recipes
  get 'allRecipes' => 'recipes#index'


  #following three  routes below may not be used 

    #user interests bridge
    get 'addNewInterest' => 'interests#new'
    get 'addInterest' => 'user_interests#new'
    
    #user activity
    get 'addNewActivity' => 'activities#new'   
    get 'addActivity' => 'user_activities#new'
    
    #user sport
    get 'addNewSport' => 'sports#new'
    get 'addSport' => 'user_sports#new'

    #user movie
    get 'addNewMovie' => 'movies#new'
    get 'addMovie' => 'user_movies#new'

    #user movie
    get 'addNewBook' => 'books#new'
    get 'addBook' => 'user_books#new'

    #user book
    get 'addNewTvshow' => 'tvshows#new'
    get 'addTvshow' => 'user_tvshows#new'



  #session controller routes....login sends a GET and POST request 
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'#post command 'sends all form submition data' to the user
  delete 'logout'  => 'sessions#destroy'

  #user following association
  resources :users do
    member do
      get :following, :followers
    end
  end


  #resources utilized ith user model. This must include the users_helper helper files 
  resources :users, :interests, :activities, :sports, :movies, :books, :tvshows,
  :user_interests, :user_activities, :user_sports, :user_movies, :user_books, :user_tvshows

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

  resources :recipes

end


#provides GET(aquire) POST() DELETE HTTP commands which are used in hyperlinks. Imagine this as a template file 
#to all of the resources links i want use for navigation and utilization for the user. 