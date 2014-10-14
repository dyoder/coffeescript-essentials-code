Queue = require "./queue"

class PriorityQueue extends Queue
  enqueue: (priority, value) ->
    super {priority,value}
    @array.sort (a,b) -> b.priority - a.priority

module.exports = PriorityQueue
