assert = require "assert"

fib = do (s=[1, 1]) ->
  ->
    s.push s[0] + s[1]
    s.shift()

[_..., last] = (fib() for i in [1..6])
assert.equal last, 8
