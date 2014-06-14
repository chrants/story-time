Eds::Application.routes.draw do
	namespace :public do
		  get "index"
		  get "mission"
		  #get "subjects"
		  #get "programs"
		  get "about"
		  get "contact"
		  post "contact"#, to: 'send_contact'
		  #get "testimonies"
		  get "plans"
		  #get "pricing"
		  get "terms"

	end
end