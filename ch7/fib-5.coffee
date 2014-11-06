assert = require "assert"

make_fib = ->
  values = [1, 1]
  next: ->
    setImmediate ->
      values.push values[0] + values[1]
      main.next values.shift()
    return

fib = do (_fib = make_fib()) ->
  -> _fib.next()

main = do ->
  last = yield fib() for i in [1..6]
  assert.equal last, 8

main.next()
