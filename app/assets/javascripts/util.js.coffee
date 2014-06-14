@getSerialized = (form) ->
    arr = form.serializeArray()
    serialized = {}
    for obj in arr
        do () ->
            serialized[obj.name] = obj.value
    console.log serialized
    serialized

@redirect_to = (string) ->
    window.location.assign string

@redirect_no_history = (string) ->
    window.location.replace string
    
@postForm = (form, callback=@blank_function) ->
    $.post form.attr('action'), getSerialized(form), callback

String.prototype.replaceAll = (regex, replacement) -> 
    retstr = this
    while temp != retstr
        temp = retstr
        retstr = retstr.replace(regex, replacement)
    return retstr
