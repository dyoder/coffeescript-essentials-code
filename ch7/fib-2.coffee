assert = require "assert"

fib = (n, callback) ->
  _fib = do (s=[1, 1]) ->
    ->
      s.push s[0] + s[1]
      s.shift()

  _next = ->
    if --n > 0
      _fib()
      setImmediate _next
    else
      callback _fib()

  _next()


fib 6, (r) ->
  assert.equal r, 8
