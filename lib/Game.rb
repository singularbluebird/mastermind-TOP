require_relative 'CodeMaker'
require_relative 'CodeBreaker'

class Game
  attr_accessor :board, :positions, :p_maker, :p_breaker, :previous_player, :next_player, :move_counter

  def initialize(maker, breaker)

    @p_maker, @p_breaker = CodeMaker.new(maker), CodeBreaker.new(breaker)
    @positions = Array.new(12) { Array.new(4) { "#" } + Array.new(4) { "*" } }
    @board = draw_game(8, @positions)
    @previous_player = @p_maker
    @next_player = @p_breaker
    @move_counter = 0.0
    puts """Welcome to Mastermind. In this game, there is a code guesser and a code breaker.
    In here you'll play as the code breaker. The computer will pick a code of 4 possible colours and you have to guess it correctly. You get 12 guesses total. Each guess will appear in a row with the \"*\" on them and the feedback for that specific guess will be displayed besides it where the \"#\" is displayed."""

    self.draw_b
    
    @p_maker.make_code_rand
  end

  # Method to make a move when possible and advance the game
  def make_move()
    puts "#{@next_player.name} it is now your turn."

    @next_plaer.make_move

    # Update positions with the new move (be it a guess or feedback)
    if @next_player is CodeBreaker
      self.positions[self.move_counter.floor].delete("#")
      @next_player.guess.reverse.each { |g| self.positions.unshift(e) }
    else
      self.positions[self.move_counter.floor].delete("*")
      @next_player.feedback.reverse.each { |f| self.positions.unshift(f) }
    end
    @move_counter += 0.5

    draw_game(8, self.positions) 
  end

  # Method for drawing top part of piece
  def draw_top_part(num)
    str = "\t\t\t"

    (0..(6*num)).each do |i|
      i % 6 == 0 ? str << "|" : str << 8254.chr(Encoding::UTF_8)
    end
    
    str << "\n"
    return str
  end

  # Method for drawing middle part of piece
  def draw_mid_part(num, arr)
    str = "\t\t\t"

    (0..(6*num)).each do |i|
      if i % 6 == 3
        str << arr[(i-3)/6]
      elsif i % 6 == 0 
        str << "|"
      else
        str << " "
      end
    end

    str << "\n"
    return str
  end

  # Method for drawing last part of piece
  def draw_last_part(num)
    str = "\t\t\t"

    (0..(6*num)).each do |i|
      i % 6 == 0 ? str << "|" : str << "_"
    end

    str << "\n"
    return str
  end

  # A better method to draw the board
  def draw_game(num, arr)
    str = ""

    (0..11).each do |i|
      str << draw_top_part(num)
      str << draw_mid_part(num, arr[i])
      str << draw_last_part(num)
    end

    return str
  end
  # Drawing the board (again)
  def draw_b()
    puts @board
  end


  # Updates the board
  def update_board(move)
   if @next_plaer == @p_breaker
     @board[@next_player.move_counter][] 
   end
  end
end
# Ok this would all make more sense if the shape of the board was like this [[], []] where 
# the first one is for the breaker and the next one is for the maker. You can work on that
# next time.
