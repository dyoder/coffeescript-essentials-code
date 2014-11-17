assert = require "assert"

fib = do (make_generator=null) ->
  make_generator = (n) ->
    do (s=[1, 1], i=0) ->
      next: ->
        s.push s[0] + s[1]
        value: s.shift(), done: (++i == n)

  (n) ->
    do (generator=null, done=false) ->
      generator = make_generator(n)
      {value, done} = generator.next() until done
      value

assert.equal (fib 6), 8
