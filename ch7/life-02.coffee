Life = require "./life-0"
{iterate} = Life

block = [
  [ false, false, false, false ]
  [ false, true,  true,  false ]
  [ false, true,  true,  false ]
  [ false, false, false, false ]
]

assert = require "assert"
assert.deepEqual (iterate block), block
