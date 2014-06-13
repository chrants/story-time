Eds::Application.routes.draw do
	namespace :admin do
		get   'home'
		get   "index", action: 'home'
		get   "feed"
		get   "flags"
		get   "uploads"
		get   "pending_uploads"

		post  'users/:id/delete', to: 'users#destroy'

    match 'uploads/:id' => 'uploads#show'
		post  'uploads/:id/delete', to: 'uploads#destroy'
		post  'uploads/:id/update', to: 'uploads#update'
	end
end