Eds::Application.routes.draw do
  resources :groups do 
    resources :stories do
      post '/:id/scene', action: 'story_scene'
    end
  end
end