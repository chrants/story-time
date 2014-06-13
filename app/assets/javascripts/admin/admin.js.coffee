$(document).ready () ->
	$('.approveBtn').click (evt) ->
		obj = $(this).parent()
		#data = {
		#	approved: true
		#}
		console.log "Approving #{obj}", obj
		$.post("/uploads/#{obj.data('id')}/update",
			{
				approved: true
			}, (data, status, xhr) ->
        $(this).attr('disabled', 'disabled').
          text('approved')
      ).fail(() ->
        alert 'An error has occured'
      )
		evt.preventDefault()

	$('.deleteBtn').click (evt) ->
		obj = $(this).parent()
		$.post("/uploads/#{obj.data('id')}/delete", {},
			(data, status, xhr) ->
        obj.parent().parent().remove()
      ).fail(() ->
        alert 'An error has occured'
      )
		evt.preventDefault()

#$('.')

###$('.edit-form .editBtn').click (evt) ->

	evt.preventDefault()###