Life = require "./life-10"

{build, run, print} = Life

start = (g) ->
  do (context = {}) ->
    context.iterator = g(context)
    context.iterator.next()

start (context) ->
  done = false
  iterator = run context, build()
  until done
    {done, value} = yield iterator.next()
    print value
    console.log "\n"
