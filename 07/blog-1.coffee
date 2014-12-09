fs = require "fs"
marked = require "marked"

readFile = (path, it) ->
  fs.readFile path, (error, buffer) ->
    unless error?
      it.next buffer.toString()
    else
      it.throw error

writeFile = (path, content, it) ->
  fs.writeFile path, content, (error, buffer) ->
    unless error?
      it.next()
    else
      it.throw error

compile = ({it}) ->
  try
    md = yield readFile "my-blog-post.md", it
    html = marked md
    yield writeFile "my-blog-post.html", html, it
  catch error
    console.log "#{error}"

start = (g) ->
  context = {}
  context.it = g(context)
  context.it.next()

start compile

  # , (error, buffer) ->
  #   unless error?
  #     try
  #       html = marked buffer.toString()
  #       writeFile "my-blog-post.html", html, (error) ->
  #         if error?
  #           console.error error
  #     catch error
  #       console.error error
  #   else
  #     console.error error
