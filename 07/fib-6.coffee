assert = require "assert"

count = 0
do counter = ->
  count++
  setTimeout counter, 10

make_fib = ->
  values = [1, 1]
  _next = ->
    values.push values[0] + values[1]
    main.next values.shift()
  next: ->
    setTimeout _next, 20
    return

fib = do (_fib = make_fib()) ->
  -> _fib.next()

main = do ->
  last = yield fib() for i in [1..6]
  assert.equal last, 8
  assert.equal count, 12
  process.exit()

main.next()
