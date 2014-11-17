promise = (resolver) ->
  handlers =
    resolve: ->
    reject: (error) -> throw error

  resolve = -> handlers.resolve arguments...
  reject = (error) -> handlers.reject error

  resolver resolve, reject

  then: (handler) ->
    handlers.resolve = handler
    return @
  'catch': (handler) ->
    handlers.reject = handler
    return @

fs = require "fs"

readFile = (path) ->
  promise (resolve, reject) ->
    fs.readFile path, (error, buffer) ->
      unless error?
        resolve buffer
      else
        reject error

readFile "my-blog-post.md"
.then (buffer) ->
  console.log buffer.toString()
.catch (error) ->
  console.error error.toString()
