
$(() ->
	$('#loginForm').submit (evt) ->
		evt.preventDefault()
		postForm $(this)
	$('#signupForm #planSelection input').click () ->
		if $(this).is('checked')
			switch $(this).attr("value")
				when 'user'
					;
				when 'member'
					;
					# Payment.
				when 'beta_member'
					;
		else
			switch $(this).attr("value")
				when 'user'
					;
				when 'member'
					;
					# Hide Payment.
				when 'beta_member'
					;

	$('#signupForm').submit (evt) -> 
		unless $('#agreeBox').is('checked')
			evt.preventDefault()
			alert('You must agree to our terms and conditions.')
			return
		#$('#signupForm #planSelection input[value=beta_member]')[0].checked = true
)