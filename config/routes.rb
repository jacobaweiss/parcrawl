Parcrawl::Application.routes.draw do
  resources :matches
  
  root :to => 'matches#new'
end
