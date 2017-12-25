Rails.application.routes.draw do


  resources :memberships
  resources :packages
    #resources :profiles
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


    # Profiles
    get "/profile/edit/:slug" => "profiles#edit" , as: :edit_profile
    get "/profile/complete/:slug" => "profiles#complete", as: :complete_profile
    #get "/profile/:slug" => "profiles#show" , as: :show_profile

    # Projects
    get "/projects/my-projects" => "projects#index", as: :my_projects
    get "/projects/recent" => "projects#recent_projects", as: :recent_projects
    get "/projects/show/:id" => "projects#show", as: :project_show
    get "/projects/nearby" => "projects#projects_nearby", as: :projects_nearby
    
    get "/workers" => "workers#index", as: :workers
    get "/workers/profile/:slug" => "workers#show", as: :show_worker_profile
    get "/workers/nearby" => "projects#projects_nearby", as: :workers_nearby
    get "/workers/search/" => "workers#search", as: :search_workers

    get "/employers" => "employers#index", as: :employers
    get "/employers" => "employers#near_by", as: :employers_nearby
    get "/employers/profile/:slug" => "employers#show", as: :show_employer_profile

    
    get 'projects/update_skills', :as => 'update_skills'
    get 'read_notification' => 'notifications#show', as: :read_notification
    get 'read-message' => 'messages#show', as: :read_message
    
    get "/attributions" => "attributions#new", as: :attributions
    get "/about" => "pages#about", as: :about
    get "/terms-of-service" => "pages#terms", as: :terms
    get "/privacy-policy" => "pages#privacy_policy", as: :privacy_policy

    get "/messages/new" => "messages#new", as: :new_message

    get "/membership/subscription" => "memberships#index", as: :membership_subscription
    get "/membership/subscription" => "memberships#basic", as: :membership_basic_subscription
    get "/membership/subscription" => "memberships#plus", as: :membership_plus_subscription
    get "/membership/subscription" => "memberships#pro", as: :membership_pro_subscription
   
    
    # Example Devise routes
    #devise_for :users, controllers: {
    #sessions: 'users/sessions'
    #}
    resources :subscriptions
   
   
      resources :projects do
          get 'delete'
     end
     resources :messages do
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
   # mount Ckeditor::Engine => '/ckeditor'
end
