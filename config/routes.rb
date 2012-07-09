Parcrawl::Application.routes.draw do
  resources :matches do
    resources :players, :holes, :penalties
  end
  
  resources :holes do
    resources :scores
  end
  
  root :to => 'matches#new'
end
