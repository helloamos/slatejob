Rails.application.routes.draw do


  #resources :profiles
  
  
  post '/rate' => 'rater#create', :as => 'rate'
    #resources :projects
    resources :domains
 
    resources :profession_skills
    resources :professions
    #resources :experiences
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
    get "/profile/:slug" => "profiles#show" , as: :show_profile
    get "/projects/recent" => "projects#recent_projects", as: :recent_projects
    get "/projects/show/:id" => "projects#show", as: :project_show
    get "/projects/show/:category/" => "projects#projects_by_category", as: :project_by_category
    get "/projects/nearby" => "projects#projects_nearby", as: :projects_nearby
    
    get 'projects/update_skills', :as => 'update_skills'
    get 'read_notification' => 'notifications#show'
    get "/freelances" => "profiles#index", as: :freelances
    get "/attribute-project/" => "attribute_projects#attribute", as: :attribute
    #get "/dashboard/projects" => "projects#index", as: :projects
    get "/about" => "pages#about", as: :about
    get "/terms-of-service" => "pages#terms", as: :terms
    get "/privacy-policy" => "pages#privacy_policy", as: :privacy_policy
   
    
    # Example Devise routes
    #devise_for :users, controllers: {
    #sessions: 'users/sessions'
    #}
    resources :subscriptions
   
   
      resources :projects do
          get 'delete'
     end
    resources :bids do 

        get 'delete'
    end
     resources :experiences do 

        get 'delete'
    end
     resources :user_skills do 
        get 'delete'
     end
    resources :awards do 
        get 'delete'
    end
    resources :certifications do 
        get 'delete'
    end
  resources :educations do 
    get 'delete'
    end

    resources :profiles do 
    get 'delete'
    end

      resources :user_languages do 
        get 'delete'
    end

    #devise_for :users, path: 'user', path_names: { 
        #sign_in: 'login', 
        #sign_out: 'logout', 
        #password: 'secret', 
        #confirmation: 'verification', 
        #unlock: 'unblock', 
        #registration: 'register', 
        #sign_up: '' 

    #}
    devise_for :users, path: '', controllers: { 
            registrations: "registrations",
            passwords: "passwords"
        }, 
        path_names: {
            sign_in: 'login', 
            sign_out: 'logout', 
            password: 'secret', 
            confirmation: 'verification', 
            unlock: 'unblock', 
            registration: 'signup', 
            sign_up: '' 
        }


    # Bootsy edito routes.
    #mount Bootsy::Engine => '/bootsy', as: 'bootsy'
end
