ActionController::Routing::Routes.draw do |map|

  # Home Page
  map.root :controller => "accounts", :action => "index"

  # Authlogic Routing
  map.resources :password_resets
  map.resource :user_session
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.login '/login', :controller => 'user_sessions', :action => 'new'
  map.operator '/operator', :controller => 'user_sessions', :action => 'new'
  map.profile '/operator/profile/:id', :controller => 'admin/users', :action => 'edit'
  map.forgot_password '/forgot_password', :controller => 'password_resets', :action => 'new'
  
  # Operator Resources
  map.namespace :operator do |operator|
    operator.resources :accounts, :as => 'areas', :has_many => [:services, :specials, :testimonials, :frontpages]
  end

  # Account Resources
  map.resources :accounts, :member => { :area_search => :get }, :has_many => [:services, :specials, :testimonials, :frontpages]
  map.resources :services, :specials, :testimonials, :path_prefix => ":region/:accountlink"
  map.locations 'locations', :controller => "accounts", :action => "locations"              

  
  # Admin Resources
  map.namespace :admin do |admin|
    admin.resources :users, :pages, :tips, :photos
  end

  # Public Help Rewrites
  map.page 'page/:permalink', :controller => 'pages', :action => 'show'
  map.resources :pages
  map.support '/support', :controller => 'pages', :action => 'show', :permalink => 'support'
  map.general_services '/services', :controller => 'pages', :action => 'show', :permalink => 'services'
  map.general_testimonials '/testimonials', :controller => 'pages', :action => 'show', :permalink => 'testimonials'

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
  # Account Rewrites
  map.area ":region/:accountlink", :controller => "accounts", :action => "show"
  
end