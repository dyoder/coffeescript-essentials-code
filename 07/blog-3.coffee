{liftAll} = require "when/node"
{call} = require "when/generator"
{readFile, writeFile} = (liftAll require "fs")
marked = require "marked"

call ->
  try
    buffer = yield readFile "my-blog-post.md"
    html = marked buffer.toString()
    yield writeFile "my-blog-post.html", html
  catch error
    console.log "#{error}"
