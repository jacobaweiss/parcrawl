Parcrawl::Application.routes.draw do
  resources :matches do
    resources :players, :holes
  end
  
  root :to => 'matches#new'
end
