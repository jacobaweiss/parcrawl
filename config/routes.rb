Parcrawl::Application.routes.draw do
  resources :matches, :only => [:show, :new, :create] do
    match '/login' => 'matches#login', :via => :get
    match '/' => 'matches#authorize', :via => :post
    resources :players, :only => [:show, :create]
    resources :holes, :only => [:show, :create]
    resources :penalties, :only => [:create]
  end
  
  resources :holes, :only => [:show, :new, :create] do
    resources :scores, :only => [:create]
  end
  
  root :to => 'matches#new'
  match '/about' => 'pages#about'
  match "*path"  => 'application#routing_error'
end
