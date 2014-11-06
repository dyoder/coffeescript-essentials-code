assert = require "assert"

make_fib = ->

  values = [1, 1]

  next: ->
    values.push values[0] + values[1]
    value: values.shift(), done:false


fib = do (_fib = make_fib()) ->
  -> _fib.next().value

[_..., last] = (fib() for i in [1..6])
assert.equal last, 8
