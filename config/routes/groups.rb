Eds::Application.routes.draw do
  resources :groups do 
    resources :stories do
      post '/scene', action: 'story_scene'
    end
  end
end