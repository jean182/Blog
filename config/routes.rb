Rails.application.routes.draw do
  
  devise_for :users
 resources :articles do
 	resources :comments, only: [:create, :destroy, :update]
 end
 #Permite realizar acciones CRUD

  #get 'welcome/index'
 

 root 'welcome#index'

 #http
 #	Verbos:
 #		GET
 #		POST
 #		PATCH
 # 		PUT
 #		DELETE
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
