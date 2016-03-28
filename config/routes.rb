Rails.application.routes.draw do
  get 'welcome/homepage'
  resources :projects
  resources :regs
  resources :issues
  resources :projectnames
  resources :projectmembers

  get "sign_in" => "signup#sign_in"	
  post "sign_in" => "signup#login"
  get "homepage" => "welcome#homepage"
  get "homepagenew" => "welcome#homepagenew"
  get "new_user" => "register#new_user"
  put "new_user" => "register#sign_up"
  get "newproject" => "projectname#newproject"
  post "newproject" => "projectname#createproject"
  put "newproject" => "projectname#createproject"
  get "newupdate" => "updateproject#newupdate"
  put "newupdate" => "updateproject#update"
  get "searchuser" => "register#init"
  get "index" => "register#index"
  post "index" => "register#index"
  get "searchproject" => "projectname#initproject"
  get "indexproject" => "projectname#indexproject"
  post "indexproject" => "projectname#indexproject"
  get  "search" => "welcome#searchbar"   
  get  "newissue" => "issue#newissue"   
  post  "newissue" => "issue#createissue"   
  put  "newissue" => "issue#createissue"   
  get "searchissue" => "issue#initissue"
  get "indexissue" => "issue#indexissue"
  post "indexissue" => "issue#indexissue"
  get "newupdateissue" => "issue#newupdateissue"
  put "newupdateissue" => "issue#updateissue"
  get "sign_out" => "signup#sign_out"	
  post "sign_out" => "signup#log_out"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#homepage'
  
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
