ActionController::Routing::Routes.draw do |map|
  map.search_box '/search_box', :controller => 'search_box', :action => 'view'
  map.search_box '/search_box/search', :controller => 'search_box', :action => 'search'
  map.resources :genres
  map.resources :categories
  map.resources :age_limits
  map.resources :businesses
  map.resources :maps
  map.resources :users
  map.resources :movies
  map.resources :posts
  map.resources :menu
  map.resources :chat_two
  map.search '/search', :controller => 'event_instances', :action => 'search'
  map.resources :event_instances
  map.resources :event_instances, :member => {:rate => :post}
  map.resource :user_session
  map.root :controller => "event_instances", :action => "index"
  map.password_resets '/password_resets/new', :controller => :password_resets, :action => :new
  map.password_resets '/password_resets/edit', :controller => :password_resets, :action => :edit
  map.application_message '/application/message', :controller => :application, :action => :message
  map.resource :account, :controller => "users"
  map.resources :users
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  # map.content :controller => "posts"

  # See how all your routes lay out with "rake routes"


  
  
  # optional, this just sets the root route
  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  

