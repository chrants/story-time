$(document).ajaxComplete(function(evt, xhr, ajaxOptions) {
  var response;
  response = xhr.responseJSON || ("(" + xhr.responseHTML + ")") || ("(" + xhr.responseText + ")");
  console.log(xhr);
  if ((response != null) && (response.command != null)) {
    switch (response.command) {
      case 'REDIRECT':
        if (response.location != null) {
          return redirect_to((response.location === "SELF" ? $('#page').data('page') : response.location));
        } else {
          return console.log("WARNING: [" + response.command + "] Response has no location.");
        }
        break;
      case 'ALERT':
        switch (response.alert["class"]) {
          case 'error':
            response.alert["class"] = "danger";
        }
        return $('.alert').addClass("alert-" + response.alert["class"]).show().removeClass("hidden").alert().find('.body').html(response.alert.message);
      case 'LOGOUT':
        return redirect_no_history('/logout');
      case 'CUSTOM':
        return eval(response.action);
    }
  } else {
    return console.log("Response has no command: " + response);
  }
});