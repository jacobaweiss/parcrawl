Parcrawl::Application.routes.draw do
  resources :matches do
    resources :players
  end
  
  root            :to => 'matches#new'
  match '/:name', :to => 'matches#show'
end
