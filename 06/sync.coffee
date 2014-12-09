{readFileSync, writeFileSync} = require "fs"
marked = require "marked"

try
  markdown = (readFileSync "my-blog-post.md").toString()
  html = marked markdown
  writeFileSync "my-blog-post.html", html
catch error
  console.error error
