Rwm4::Application.routes.draw do
  devise_for :users
  
  #*********** Static Pages *********#
  root 'static_pages#home_page'

  #*********** User Homepage *********#

  get 'dash' => 'user_dash#dash'

  #*********** Article Handler *********#
  get 'articles' => 'article#index'

  #Render iFrame
  get 'articles/iFrame' => 'article#iFrame'

  #Render show
  get 'articles/show/:id' => 'article#show', as: 'article_url'

  #add article
  post 'articles/add_new_article' => 'article#add_new_article'

  #Handle Public posts
  get 'articles/public/:id' => 'article#public_show'



  #*********** Group Handler *********#
  get 'groups' => 'group#index'

  post 'groups/assign_to_group' => 'group#assign_to_group'

  post 'groups/create' => 'group#create'

  get 'groups/show/:id' => 'group#show'

  get 'groups/new' => 'group#new'

  #*********** Comment Handler *********#

  post 'comment/new_comment' => 'comment#add_new_comment'


  #************* Session ************#
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

# The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:index/purchase' => 'catalog#purchase', as: :purchase

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
