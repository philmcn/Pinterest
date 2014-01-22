Pinterest::Application.routes.draw do
  match '/rate' => 'rater#create', :as => 'rate'

  opinio_model

  get "users/show"

  get "user/show"

  resources :pins do
    get :top, on: :collection
    opinio
  end

  get 'inf' => 'pins#inf', :as => 'inf'
  get 'pins_feed' => 'pins#pins_feed', :as => 'pins_feed'
  get 'feed' => 'pins#feed', :as => 'feed'
  get 'new_feed' => 'pins#feed', :as => 'new_feed'

  devise_for :views

  devise_for :users, :controllers => {:registrations => "registrations"}
  match 'users/:id' => 'users#show', as: :user

  get 'about' => 'pages#about'

  root :to => 'pins#index'

  match 'auth/:provider/callback', to: 'authentications#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'authentications#destroy', as: 'signout'

  # The priority is based upon order of creation:
  # first created -> highest priority.
resources :pins
match '/pins_feed' => 'pins#pins_feed',
      :as => :pins_feed,
      :defaults => { :format => 'atom' }
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
resources :jobs do
  collection do
    post 'inbox'
  end
end
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
