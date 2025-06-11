require_relative 'CodeMaker'
require_relative 'CodeBreaker'
require_relative 'PossibleColours'
require 'colorize'

class Game
  attr_accessor :board, :positions, :p_maker, :p_breaker, :previous_player, :next_player, :move_counter, :possible_make_colours, :possible_guess_colours

  def initialize

    @p_maker, @p_breaker = CodeMaker.new, CodeBreaker.new
    @positions = Array.new(12) { Array.new(4) { "#" } + Array.new(4) { "*" } }
    @board = draw_game(8, @positions)
    @previous_player = @p_maker
    @next_player = @p_breaker
    @move_counter = 0.0
    @possible_make_colours = {'B'=> 9675.chr(Encoding::UTF_8), 'W'=> 9679.chr(Encoding::UTF_8), '*'=> '*'}
    @possible_guess_colours = {'R'=> 9679.chr(Encoding::UTF_8).colorize(:red), 'G'=> 9679.chr(Encoding::UTF_8).colorize(:green), 'B'=> 9679.chr(Encoding::UTF_8).colorize(:blue), 'Y'=> 9679.chr(Encoding::UTF_8).colorize(:yellow), 'O'=> 9679.chr(Encoding::UTF_8).colorize(:orange), 'P'=>9679.chr(Encoding::UTF_8).colorize(:pink) }
    puts """Welcome to Mastermind. In this game, there is a code guesser and a code breaker.
    In here you'll play as the code breaker. The computer will pick a code of 4 possible colours and you have to guess it correctly. You get 12 guesses total. Each guess will appear in a row with the \"*\" on them and the feedback for that specific guess will be displayed besides it where the \"#\" is displayed."""

    
    puts @board
    @p_maker.make_code_rand
  end

  # Method to make a move when possible and advance the game
  def make_move()
    puts "#{@next_player.name} it is now your turn."

    if @next_player == @p_maker
      @next_player.make_move(@previous_player.guess)
    else
      @next_player.make_move
    end

    self.update_positions
    p @positions

    if self.did_anyone_win?
      puts "Congratulations #{@next_player} is the winner, better luck next time #{@previous_player}"
      @board = draw_game(8, @positions)
      puts @board
    else
      self.swap_players
      @board = draw_game(8, @positions)
      puts @board
    end
  end

  def update_positions
    if @next_player.instance_of? CodeBreaker
      self.positions[self.move_counter.floor].delete("#")
      @next_player.guess.reverse.each { |g| self.positions[self.move_counter.floor].unshift(@possible_guess_colours[g]) }
    else
      self.positions[self.move_counter.floor].delete("*")
      @next_player.feedback.each { |f| self.positions[self.move_counter.floor].push(@possible_make_colours[f]) }
      puts @next_player.feedback
    end
    @move_counter += 0.5
  end

  def did_anyone_win?
    has_anyone_won = self.move_counter == 6.0 || p_breaker.guess == p_maker.code ? true : false

    return has_anyone_won
  end

  def swap_players
    @next_player = self.next_player == p_maker ? p_breaker : p_maker
    @previous_player = self.previous_player == p_breaker ? p_maker : p_breaker
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

end
# Ok this would all make more sense if the shape of the board was like this [[], []] where 
# the first one is for the breaker and the next one is for the maker. You can work on that
# next time.
