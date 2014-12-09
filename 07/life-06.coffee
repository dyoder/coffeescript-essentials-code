module.exports = do ->

  {build, iterate, fate, neighbors} =

    build: (size = 16, density = 1/3) ->
      world = []
      for x in [0..size-1]
        world[x] = []
        for y in [0..size-1]
          world[x][y] = Math.random() <= density
      world

    iterate: (before) ->
      after = []
      for row, x in before
        after[x] = []
        for col, y in row
          after[x][y] = fate before, x, y
      after

    fate: (world, x, y) ->
      count = (neighbors world, x, y).length
      alive = world[x][y]
      (alive && 2 <= count <= 3) || (!alive && count == 3)

    neighbors: do (directions = [], radd = null)->
      for dx in [-1, 0, 1]
        for dy in [-1, 0, 1]
          directions.push [dx, dy] unless dx == dy == 0

      radd = (x, y, size) -> (x + y + size) % size

      (world, x, y) ->
        results = []
        size = world.length
        for [dx, dy] in directions
          x_ = radd x, dx, size
          y_ = radd y, dy, size
          results.push [x_, y_] if world[x_][y_]
        results

    run: (world, generations) ->
      for i in [1..generations]
        yield (world = iterate world)
      world

    print: do ->
      write = (string) -> process.stdout.write string
      (world) ->
        for row in world
          for col in row
            write (if col then " *" else " -")
          write "\n"
