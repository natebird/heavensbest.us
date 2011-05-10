Heavensbest::Application.routes.draw do
  match '/' => 'accounts#index'
  match '/logout' => 'sessions#destroy', :as => :logout
  match '/login' => 'sessions#new', :as => :login
  match '/register' => 'admin/users#create', :as => :register
  match '/signup/:activation_code' => 'admin/users#activate', :as => :activate, :activation_code => 
  match '/forgot_password' => 'passwords#new', :as => :forgot_password
  match '/change_password/:reset_code' => 'passwords#reset', :as => :change_password
  match '/opensession' => 'sessions#create', :as => :open_id_complete, :constraints => { :method => get }
  match '/opencreate' => 'users#create', :as => :open_id_create, :constraints => { :method => get }
  resources :passwords
  resource :session
  match '/operator/areas/:id/cancel' => 'operator/accounts#cancel', :as => :cancel
  match '/operator/areas/:id/billing' => 'operator/accounts#billing', :as => :billing
  match '/operator/areas/:id/plan' => 'operator/accounts#plan', :as => :plan
  resources :accounts do
  
    member do
  get :area_search
  end
  
  end

  resources :services
  match 'locations' => 'accounts#locations', :as => :locations
  match '/operator' => 'sessions#new', :as => :operator
  match '/operator/profile/:id' => 'admin/users#edit', :as => :profile
  namespace :operator do
      resources :accounts do
        collection do
    get :canceled
    end
        member do
    any :billing
    any :plan
    any :paypal
    any :cancel
    end
    
    end
  end

  namespace :admin do
      resources :users
      resources :pages
      resources :tips
      resources :photos
  end

  match 'page/:permalink' => 'pages#show', :as => :page
  resources :pages
  match '/support' => 'pages#show', :as => :support, :permalink => 'support'
  match '/services' => 'pages#show', :as => :general_services, :permalink => 'services'
  match '/testimonials' => 'pages#show', :as => :general_testimonials, :permalink => 'testimonials'
  match '/:controller(/:action(/:id))'
  match ':region/:accountlink' => 'accounts#show', :as => :area

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
