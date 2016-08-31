Rims::Application.routes.draw do
  resources :stocks
  get "welcome/index"
  devise_for :users

  root :to => 'items#index'
  #root :to => redirect('/items')
  resources :items
  resources :users
  
  resources :items do
     
    resources :stocks 
 
    
    
  end
  
  get '/change' => 'stocks#change', :as => :change
end
