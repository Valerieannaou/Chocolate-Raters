ChocolateRatingSystem::Application.routes.draw do
  get "user/index"
  get "chocolates/recent_ratings"
  get "ratings/index"

  resources :chocolatiers do
    collection do
      get 'requests'
    end
    member do
      get 'approve'
    end
  end
  resources :user do
    collection do
      get 'destroy'
      get 'new'
    end
  end


  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
             :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #get "chocolate#show_search"
  #get 'chocolates/:search', to: 'chocolates#show'
  resources :chocolates do
    collection do
      get 'show_search'
      get 'rate_chocolate'
      get 'user_review'
    end
  end
  resources :photos
  resources :ratings  do
    collection do
      get 'add_rating'
      get 'edit_rating'
    end
    end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  # match 'chocolates/:search' => 'chocolates#show_search'
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
  root :to => 'static#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
