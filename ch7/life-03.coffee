Life = require "./life"
{iterate, print} = Life

blinker = [
  [ false, false, false, false]
  [ false, true, false, false ]
  [ false, true, false, false ]
  [ false, true, false, false ]
]

assert = require "assert"
assert.deepEqual (iterate iterate blinker), blinker
