Eds::Application.routes.draw do
	namespace :user do
		get 'home'
		get "index", 	action: 'home'
		get 'profile'
		get 'signup', 	action: 'show_signup'
		post 'signup'
		get 'login', 	action: 'show_login'
		post 'login'
		get 'view_subjects'
		get 'view_topics'
		get 'show_download'
		get 'logout'
		post 'logout'
		get 'upgrade'
		get 'welcome'
		get 'confirm_email/:token/:email', action: 'show_confirm_email'
		resources :schools
	end
end