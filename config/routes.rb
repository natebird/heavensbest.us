ActionController::Routing::Routes.draw do |map| 
  # Restful Authentication Rewrites
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
  map.change_password '/change_password/:reset_code', :controller => 'passwords', :action => 'reset'
  map.open_id_complete '/opensession', :controller => "sessions", :action => "create", :requirements => { :method => :get }
  map.open_id_create '/opencreate', :controller => "users", :action => "create", :requirements => { :method => :get }
  
  # Restful Authentication Resources
  map.resources :users
  map.resources :passwords
  map.resource :session
  
  # Home Page
  map.root :controller => "accounts", :action => "index"

  # Area (Account) Rewrites
  # map.country "/area/:country", :controller => "countries", :action => "show"
  # map.region "/area/:country/:region", :controller => "regions", :action => "show"
  # map.area "/area/:country/:region/:area", :controller => "areas", :action => "show" 
  # map.area ":region/:area", :controller => "areas", :action => "show"


  map.cancel '/operator/areas/:id/cancel', :controller => 'operator/accounts', :action => 'cancel'
  map.billing '/operator/areas/:id/billing', :controller => 'operator/accounts', :action => 'billing'

  # map.resource :client, :collection => { :thanks => :get, :cancel => :any, :canceled => :get }
  map.resources :accounts, :as => 'areas', :collection => { :auto_complete_for_account_locations => :get }#, :has_many => :services

  # map.resources :services

  # Operator Resources
  map.operator '/operator', :controller => 'sessions', :action => 'new'
  map.profile '/operator/profile', :controller => 'admin/users', :action => 'edit'
  map.namespace :operator do |operator|
    operator.resources :accounts, :as => 'areas', 
      :member => { :billing => :any, :paypal => :any, :plan => :any, :cancel => :any }, 
      :collection => { :canceled => :get }#,
      # :has_many => :services
      #:has_many => [ :services, :specials, :testimonials, :tips ]
  end
  
  # Admin Resources
  map.namespace :admin do |admin|
  admin.resources :users    
    admin.resources :pages
  #   admin.resources :tickets
  #   admin.resource :client, :collection => { :thanks => :get, :cancel => :any, :canceled => :get }
  #   admin.resources :tips
  end

  # Public Help Rewrites
  map.page 'page/:permalink', :controller => 'pages', :action => 'show'
  # map.support '/support', :controller => 'tickets', :action => 'new'

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
