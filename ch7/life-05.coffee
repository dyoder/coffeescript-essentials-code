Life = require "./life-4"

{build, run, print} = Life

done = false
iterator = run build(), 100
until done
  {done, value} = iterator.next()
  print value
  console.log "\n"
