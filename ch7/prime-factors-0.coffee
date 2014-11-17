prime_factors = do ({floor, sqrt} = Math) ->
  (n) ->
    do (factors = [], root = (floor (sqrt n)), x = 2) ->
      while x <= root
        if n % x == 0
          factors.push x
          n /= x
        else
          x += 1
      factors.push n unless n == 1
      factors

# benchmark = (fn) ->
#   do (start=null, end=null) ->
#     ->
#       start = Date.now()
#       fn()
#       end = Date.now()
#       end - start
#
# {floor, random, pow} = Math
# x = floor(random() * 1e17)
# console.log do benchmark -> prime_factors x
assert = require "assert"
assert.deepEqual (prime_factors 5467154436746477), [5467154436746477]
assert.deepEqual (prime_factors 13), [13]
assert.deepEqual (prime_factors 25), [5,5]
assert.deepEqual (prime_factors 31), [31]
assert.deepEqual (prime_factors 100), [2,2,5,5]
assert.deepEqual (prime_factors 101), [101]
assert.deepEqual (prime_factors 102), [2,3,17]
assert.deepEqual (prime_factors 7019), [7019]
assert.deepEqual (prime_factors 7200), [2,2,2,2,2,3,3,5,5]
