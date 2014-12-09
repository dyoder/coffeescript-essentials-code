{liftAll} = require "when/node"
{readFile, writeFile} = (liftAll require "fs")
marked = require "marked"

readFile "my-blog-post.md"
.then (buffer) ->
  marked buffer.toString()
.then (html) ->
  writeFile "my-blog-post.html", html
.catch (error) ->
  console.error error
