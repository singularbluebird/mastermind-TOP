require_relative 'lib/Game'
require_relative 'lib/CodeMaker'
require_relative 'lib/CodeBreaker'

g = Game.new

while !g.did_anyone_win?
  g.make_move
end
