Parcrawl::Application.routes.draw do
  resources :matches, :only => [:show, :new, :create] do
    resources :players, :only => [:show, :create]
    resources :holes, :only => [:show, :new, :create]
    resources :penalties, :only => [:new, :create]
    resources :sessions, :only => [:new, :create]
  end
  
  resources :holes, :only => [:show, :new, :create] do
    resources :scores, :only => [:create]
  end
  
  root :to => 'matches#new'
  match '/about' => 'pages#about'
  match "*path"  => 'application#routing_error'
end
