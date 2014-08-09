
compile = (s) -> CoffeeScript.compile(s, bare: on)

$ ->

  dom =
    cs: $("article.cs textarea")
    js: $("article.js textarea")
    run: $("div.run.button")
    clear: $("div.clear.button")
    console: $("article.console textarea")
    error: $("article.error")

  code =
    cs: -> dom.cs.val()
    js: (s) ->
      if s? then dom.js.val(s) else dom.js.val()

  _log = (s) ->
    dom.console.val(dom.console.val() + s + "\n")

  eval("log = _log;")

  error =
    show: (e) ->
      dom.error.find("p").text(e)
      dom.error.show()
    hide: ->
      dom.error.hide()

  error.hide()

  dom.cs.keyup ->

    error.hide()

    try
      code.js(compile(code.cs()))
    catch {location, message}
      if location?
        error.show "Error on line #{location.first_line + 1}: #{message}"

  dom.run.click ->
    try
      eval(code.js())
    catch e
      error.show(e)

  dom.clear.click ->
    dom.console.val("")
