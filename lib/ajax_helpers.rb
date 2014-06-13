module AjaxHelpers
	def custom_json custom_command
		{ command: 'CUSTOM', action: custom_command }
	end

	def redirect_json location
		{ command: 'REDIRECT', location: location }
	end

	def alert_json alert_
		{ command: 'ALERT', alert: alert_ }
	end

	def logout_json
		{ command: 'LOGOUT' }
	end

	def render_redirect(address, options={})
		request.xhr? ? render(options.and json: redirect_json(address)) : redirect_to(address, options)
	end

	def render_alert(t, options={})
    respond_to do |format|
      format.html do 
        flash[:alert] = t
      end
      format.json do
        render(options.and json: alert_json(t))
      end
    end
	end

	def render_logout
		request.xhr? ? render(json: logout_json()) : redirect_to('/logout')
	end
end