assert = require "assert"

count = (n) ->
  yield i for i in [1..n]

do (i = 0, g = count 5) ->
  for i in [1..5]
    {done, value} = g.next()
    console.log {value}
    assert.equal value, i
    assert.equal done, false
