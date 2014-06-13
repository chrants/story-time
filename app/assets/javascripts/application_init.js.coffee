$(document).ajaxComplete (evt, xhr, ajaxOptions) ->
  response = xhr.responseJSON || "(#{xhr.responseHTML})" || "(#{xhr.responseText})"
  console.log xhr
  if response? and response.command?
    switch response.command
      when 'REDIRECT'
        if response.location?
          redirect_to (if(response.location is "SELF") then ($('#page').data('page')) else (response.location))
        else
          console.log("WARNING: [#{response.command}] Response has no location.")
      when 'ALERT'
        switch response.alert.class 
          when 'error' 
            response.alert.class = "danger" 
        $('.alert').addClass("alert-#{response.alert.class}").
          show().removeClass("hidden").alert().
          find('.body').html(response.alert.message)
      when 'LOGOUT'
        redirect_no_history '/logout'
      when 'CUSTOM'
        eval response.action
      else
        ;
  else
    console.log("Response has no command: #{response}")