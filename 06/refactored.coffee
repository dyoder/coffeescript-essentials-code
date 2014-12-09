{readFile, writeFile} = require "fs"
marked = require "marked"

unless_error = (callback) ->
  (error, result) ->
    unless error?
      callback? result
    else
      console.error error

read_post = (file_name, callback) ->
  readFile file_name, (error, buffer) ->
    callback error, buffer?.toString()

write_post = (file_name, html, callback) ->
  writeFile file_name, html, callback

parse_markdown = (markdown) ->
  try
    return marked markdown
  catch error
    console.error error
    return ""

read_post "my-blog-post.md", unless_error (markdown) ->
  html = parse_markdown markdown
  write_post "my-blog-post.html", html, unless_error()
