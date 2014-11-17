{readFile, writeFile} = require "fs"
marked = require "marked"

readFile "my-blog-post.md", (error, buffer) ->
  unless error?
    try
      html = marked buffer.toString()
      writeFile "my-blog-post.html", html, (error) ->
        if error?
          console.error error
    catch error
      console.error error
  else
    console.error error
