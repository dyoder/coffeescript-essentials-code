assert = require "assert"

fib = do (make_generator=null) ->
  make_generator = ->
    do (s=[1, 1]) ->
      ->
        s.push s[0] + s[1]
        s.shift()

  (n) ->
    do (generator=null) ->
      generator = make_generator()
      for i in [1..n]
        value = generator()
      value

assert.equal (fib 6), 8
assert.equal (fib 6), 8
