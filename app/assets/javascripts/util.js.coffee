###@Util =
    exists: (obj) ->
        obj?

    sleep: window.setTimeout

    #toggleFullScreen: (elem= document.getElementsByTagName('body')) ->
    #    unless document.fullscreenElement or document.mozFullscreenElement or document.webkitFullscreenElement
    #        if elem.requestFullscreen? then elem.requestFullscreen()
    #        else if elem.mozRequestFullscreen? then elem.mozRequestFullscreen()
    #     else if elem.webkitRequestFullscreen? then elem.webkitRequestFullscreen()
    # else
    #     if document.cancelFullscreen? then document.cancelFullscreen()
    #     else if document.mozCancelFullscreen? then document.mozCancelFullscreen()
    #     else if document.webkitCancelFullscreen? then document.webkitCancelFullscreen()
###
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

###
#@log = console.log

#@blank_function = () ->
#    undefined

#@global_define = (name, val) ->


#String::dasherize = ->
#    @replace /_/g, "-"

#String::replaceAll = (regexp) ->
#    replaced = new String @
#    while replaced.indexOf
###