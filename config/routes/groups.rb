Eds::Application.routes.draw do
  resources :groups do 
    resources :stories  
  end
end