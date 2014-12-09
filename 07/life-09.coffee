Life = require "./life-8"

{build, run, print} = Life

done = false
iterator = run build()

do next = ->
  setImmediate ->
    {done, value} = iterator.next()
    print value
    console.log "\n"
    next() unless done
