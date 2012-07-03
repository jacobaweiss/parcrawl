Parcrawl::Application.routes.draw do
  resources :matches
  
  root            :to => 'matches#new'
  match '/:name', :to => 'matches#show'
end
