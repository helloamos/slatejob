Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Homepage.
  root to: "home#index"

  # Example Devise routes
  #devise_for :users, controllers: {
  #sessions: 'users/sessions'
  #}

    devise_for :users, path: 'user', path_names: { 
      sign_in: 'login', 
      sign_out: 'logout', 
      password: 'secret', 
      confirmation: 'verification', 
      unlock: 'unblock', 
      registration: 'register', 
      sign_up: 'cmon_let_me_in' 
    }

end
