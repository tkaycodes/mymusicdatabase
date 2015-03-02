Rails.application.routes.draw do

  devise_for :users,
    controllers: {omniauth_callbacks:"users/omniauth_callbacks"}
  root 'search#index'

  resources :charges

  resources :trending, only: :index
  
  get '/', to:'search#index' 
  post '/', to: 'search#create', as: 'submit_search'

  get '/songs', to: 'songs#index'
  post '/songs', to: 'songs#create', as: 'add_to_my_songs'
  patch '/songs/:id', to: 'songs#update', as: 'rate_songs'

  delete '/songs/:id', to: 'songs#destroy', as:'delete_songs'

  post '/rate' => 'rater#create', :as => 'rate'



  #remember to include id in patch/delete routes!!!!

  # resources: songs
  # collection, do
  #   'search'
  # end
  

  # resources :ratings

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
