through = require "through"
markdownStream = ->
  markdown = ""
  write = (data) -> markdown += data
  end = ->
    @queue marked markdown
    @queue null
  through write, end

{createReadStream, createWriteStream} = require "fs"
marked = require "marked"

createReadStream "my-blog-post.md"
.pipe markdownStream()
.pipe createWriteStream "my-blog-post.html"
