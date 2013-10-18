Nyweb::Application.routes.draw do
  resources :users#, :only => [:show, :update,:edit]
  resources :sessions, :only => [:new, :create, :destroy]


  get "pub/index"

  root to: 'pub#index'  
  match "/about" => "pub#about"
  match "/contact" => "pub#contact"
  match "/recruit" => "pub#recruit"
  match "/ba" => "pub#ba"
  match "/signout" => "sessions#destroy"
  match "/education" => "pub#edu"
  match "/cate" => "pub#cate"
  match "/fab" => "pub#fab"
  match "/tour" => "pub#tour"
  match "/beauty" => "pub#beauty"
  match "/micropost" => "pub#micropost"
  match "/sos" => "pub#sos"
  match "/agent" => "pub#agent"

  match "/update_password" => "users#updatePWD"
  match "/update_email" => "users#updateEmail"
  match "/update_address" => "users#updateAddress"
  match "/update_phone" => "users#updatePhone"




  match "*a" => "pub#render_404"
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
