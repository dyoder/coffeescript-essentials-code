class Queue
  constructor: (@array = []) ->
  enqueue: (value) -> @array.push value
  dequeue: -> @array.shift()
  length: -> @array.length
  isEmpty: -> @array.length is 0

module.exports = Queue
