assert = (expr) ->
  throw new AssertionError unless expr
  
Queue = require "./queue"
PriorityQueue = require "./priority-queue"

do ->
  queue = new Queue

  queue.enqueue "Grocery shopping"
  queue.enqueue "Mow the lawn"
  queue.enqueue "Write Chapter 5"

  assert queue.length() == 3
  assert queue.isEmpty() == false
  assert queue.dequeue() == "Grocery shopping"

do ->
  queue = new PriorityQueue

  queue.enqueue 1, "Grocery shopping"
  queue.enqueue 2, "Mow the lawn"
  queue.enqueue 3, "Write Chapter 5"

  assert queue.length() == 3
  assert queue.isEmpty() == false
  assert queue.dequeue().value == "Write Chapter 5"

do ->

  assert PriorityQueue.__super__ == Queue::

  queue = new PriorityQueue

  assert queue.__proto__ == PriorityQueue::
  assert queue.__proto__.__proto__ == Queue::
  assert queue.__proto__.__proto__.__proto__ == Object::
  assert queue.__proto__.__proto__.__proto__.__proto__ == null

console.log "All tests passing"
