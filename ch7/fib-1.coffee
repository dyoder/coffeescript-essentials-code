assert = require "assert"

fib = do (generator=null)->
  generator = do (s=[1, 1]) ->
    ->
      s.push s[0] + s[1]
      s.shift()

  (n) ->
    for i in [1..n]
      value = generator()
    value

assert.equal (fib 6), 8
