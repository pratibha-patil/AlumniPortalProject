Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get 'students' => 'students#index'
 get 'studentsignup' => 'students#new'
  get 'alumnisignup' => 'alumnis#new'
post 'studentsignup' => 'students#create'
  post 'alumnisignup' => 'alumnis#create'

  #links to sessions actions
  get '/login' =>'sessions#new'
  post 'login' =>'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'signup'  => 'students#new' 
  get 'loginalumni' =>'sessions#newalumni'
  post 'loginalumni' =>'sessions#createalumni'
  delete 'logoutalumni' => 'sessions#destroyalumni'
  get 'signupalumni'  => 'alumnis#new' 


  #resource root for project
  #######################################
   match "/students" => "students#create", :via => [:get]
   get   "/students" => "students#create"

   ########################################
  resources :alumnis 
  resources :projects
  resources :students
  resources :articles do
  resources :comments
end
   
  resources :projects_requests
  get 'request/:id' => 'projects_requests#create', as: :request
  get 'SearchGuide/:id' =>'alumnis#list', as: :guide


  get 'getrequests' => 'projects_requests#requests', as: :getrequests
  get 'accept/:id' => 'projects_requests#accept', as: :accept

  get 'articleslist/:id' =>'articles#index', as: :getarticles
  get 'allarticles'=>'articles#listallarticles', as: :allarticles
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
