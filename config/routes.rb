Rails.application.routes.draw do
 #get 'welcome/index'

 resources :articles
 #Permite realizar acciones CRUD
 

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
