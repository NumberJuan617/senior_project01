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
  get 'editUser' => 'users#edit'
  #user edits controller routes
  get 'addProfileContent' =>'user_edits#add'
  get 'manageProfileContent' =>'user_edits#home'


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

  

  #resources utilized ith user model. This must include the users_helper helper files 
  resources :users, :interests, :activities, :sports, :movies, :books, :tvshows,
  :user_interests, :user_activities, :user_sports, :user_movies, :user_books, :user_tvshows

end


#provides GET(aquire) POST() DELETE HTTP commands which are used in hyperlinks. Imagine this as a template file 
#to all of the resources links i want use for navigation and utilization for the user. 