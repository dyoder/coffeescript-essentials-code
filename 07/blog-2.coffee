{liftAll} = require "when/node"
{readFile, writeFile} = (liftAll require "fs")
marked = require "marked"

start = (g) ->
  it = g()
  do _next = (value=null) ->
    {done, value} = it.next value
    unless done?
      value
      .then (value) -> _next value
      .catch (error) -> it.throw error

start ->
  try
    buffer = yield readFile "my-blog-post.md"
    html = marked buffer.toString()
    yield writeFile "my-blog-post.html", html
  catch error
    console.log "#{error}"
