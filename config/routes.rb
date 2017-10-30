Rails.application.routes.draw do


  
    resources :categories
    resources :skills
    resources :currencies
    resources :time_unities
    #devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # Homepage.
    root to: "home#index"
    #root to: "pages#subscription"
    #root to: "home#landing"
    #get "/home" => "home#index"
    get "/subscription" => "pages#subscription", as: :subscription
    get "/dashboard" => "dashboard#index" , as: :dashboard
    get "/profile/edit/:slug" => "profiles#edit" , as: :edit_profile
    get "/profile/show/:slug" => "profiles#show" , as: :show_profile
    get "/projects/recent" => "projects#recent_projects", as: :recent_projects
    get "/projects/show/:id" => "projects#show", as: :project_show
    get "/projects/show/:category/" => "projects#projects_by_category", as: :project_by_category
    
    get 'projects/update_skills', :as => 'update_skills'
    get 'read_notification' => 'notifications#show'
    get "/freelances" => "profiles#index", as: :freelances
    get "/attribute-project/" => "attribute_projects#attribute", as: :attribute
    get "/dashboard/projects" => "projects#index", as: :projects
   
    
    # Example Devise routes
    #devise_for :users, controllers: {
    #sessions: 'users/sessions'
    #}
    resources :subscriptions
    resources :user_details
    resources :user_contacts
    #resources :projects
      resources :projects do
          get 'delete'
     end
    resources :bids do 

        get 'delete'
    end

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
    #mount Bootsy::Engine => '/bootsy', as: 'bootsy'
end
