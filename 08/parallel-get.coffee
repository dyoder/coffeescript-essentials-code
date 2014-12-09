http = require "http"
{promise, all} = require "when"

get = (url) ->
  promise (resolve, reject) ->
    http.get url
    .on "response", (response) ->
      resolve response
    .on "error", (error) ->
      resolve error

parallel_get = (urls...) ->
  all (get url for url in urls)

assert = require "assert"
{call} = require "when/generator"

call ->
  responses = yield parallel_get(
    "http://en.wikipedia.org/wiki/Coroutine",
    "http://en.wikipedia.org/wiki/Generator_(computer_science)",
    "http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life",
    "http://en.wikipedia.org/wiki/Cellular_automaton")

  for response in responses
    assert.equal response.statusCode, 200
