Rails.application.routes.draw do


  resources :bids
    #devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # Homepage.
    #root to: "home#index"
    root to: "pages#subscription"
     #root to: "home#landing"

    get "/subscription" => "pages#subscription", as: :subscription
    get "/home" => "home#index"
    get "/dashboard" => "dashboard#index" , as: :dashboard
    get "/account" => "pages#account" , as: :account
    get "/last-projects" => "projects#last_projects", as: :last_projects
    get "/project/:id" => "projects#show", as: :project_show
    
    # Example Devise routes
    #devise_for :users, controllers: {
    #sessions: 'users/sessions'
    #}
    resources :subscriptions
    resources :user_details
    resources :user_contacts
    resources :projects

    devise_for :users, path: 'user', path_names: { 
        sign_in: 'login', 
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'register', 
        sign_up: 'cmon_let_me_in' 
    }


    # Bootsy edito routes.
    mount Bootsy::Engine => '/bootsy', as: 'bootsy'
end
