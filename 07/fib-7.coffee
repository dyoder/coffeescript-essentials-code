assert = require "assert"

start = (g) ->
  do (context = {}) ->
    context.it = g(context)
    context.it.next()

make_fib = (it) ->
  values = [1, 1]
  _next = ->
    values.push values[0] + values[1]
    it.next values.shift()
  next: ->
    setTimeout _next, 20
    return

start ({it}) ->
  fib = do (_fib = make_fib(it)) ->
    -> _fib.next()
  last = yield fib() for i in [1..6]
  assert.equal last, 8
