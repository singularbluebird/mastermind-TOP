require_relative 'lib/Game'
require_relative 'lib/CodeMaker'
require_relative 'lib/CodeBreaker'

maker = CodeMaker.new
breaker = CodeBreaker.new
g = Game.new(maker, breaker)

g.make_move
