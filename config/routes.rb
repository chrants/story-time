Eds::Application.routes.draw do

  #mount Peek::Railtie => '/peek'

  get "/fonts/:path.:ext",  to: redirect {|params| "/assets/#{params[:path]}.#{params[:ext]}"}

  root to: 'public#index'

  get 'subjects',   to: 'public#subjects'
  get 'contact',    to: 'public#contact'
  post 'contact',    to: 'public#send_contact'
  get 'index',      to: 'public#index'
  get 'about',      to: 'public#about'

  get 'logout',     to: 'user#logout'
  post 'logout',    to: 'user#logout'
  get 'login',      to: 'user#show_login'
  post 'login',     to: 'user#login'
  get 'signup',     to: 'user#show_signup'
  post 'signup',    to: 'user#signup'
  post 'users/signup', to: 'user#signup'
  get 'user',       to: 'user#home'

  get 'upload',     to: 'uploads#new'
  post 'upload',    to: 'uploads#create'

  get 'member',     to: 'member#home'
  get 'member/all_uploads', to: 'uploads#index'
  match 'member/upload' => redirect('/uploads/new')

  get 'admin',       to: 'admin#home'

  resources :uploads, :except => [ :show ]
  resources :blogs
  resources :users

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
