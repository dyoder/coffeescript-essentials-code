assert = require "assert"

fib = do (make_generator=null) ->
  make_generator = (n) ->
    do (s=[1, 1], i=1) ->
      for i in [1..n]
        s.push s[0] + s[1]
        value = s.shift()
        yield null
      return value

  (n) ->
    do (generator=null, done=false) ->
      generator = make_generator(n)
      {value, done} = generator.next() until done
      value

assert.equal (fib 6), 8

benchmark = (fn) ->
  do (start=null, end=null) ->
    ->
      start = Date.now()
      fn()
      end = Date.now()
      end - start

console.log do benchmark -> fib 1e7
