Heavensbest::Application.routes.draw do
  root :to => 'accounts#index'

  # Authentication
  devise_for :users

  match 'page/:permalink' => 'pages#show', :as => :page
  match 'support' => 'pages#show', :as => :support, :permalink => 'support'
  match 'services' => 'pages#show', :as => :general_services, :permalink => 'services'
  match 'testimonials' => 'pages#show', :as => :general_testimonials, :permalink => 'testimonials'
  match 'locations' => 'accounts#locations'

  resources :accounts do
    collection do
      get 'search'
    end
  end
  get 'accounts/autocomplete_account_name'


  match '/:region/:accountlink/services' => 'services#index', :as => 'services'
  match '/:region/:accountlink/specials' => 'specials#index', :as => 'specials'
  match '/:region/:accountlink/testimonials' => 'testimonials#index', :as => 'testimonials'
  match '/:region/:accountlink/:servicelink' => 'services#show', :as => 'service'
  
  match '/operator' => 'auth_services#signin'
  match '/operator/profile/:id' => 'admin/users#edit', :as => :profile

  namespace :operator do
    resources :accounts do
      collection do
        get :canceled
      end
      
      member do
        get :billing
        get :plan
        get :paypal
        post :cancel
      end
    end
  end

  namespace :admin do
    resources :users
    resources :pages
    resources :tips
    resources :photos
  end

  # match '/:controller(/:action(/:id))'
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
