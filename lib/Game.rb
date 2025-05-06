require_relative 'CodeMaker'
require_relative 'CodeBreaker'

class Game
  attr_accessor :board, :positions

  def initialize()

    @positions = [Array.new(4, "#") + Array.new(4, "*")]*12
    @board = draw_game(8, @positions)
    
    puts """Welcome to Mastermind. In this game, there is a code guesser and a code breaker.
    In here you'll play as the code breaker. The computer will pick a code of 4 possible colours and you have to guess it correctly. You get 12 guesses total. Each guess will appear in a row with the \"*\" on them and the feedback for that specific guess will be displayed besides it where the \"#\" is displayed."""

    self.draw_b()

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
        str << arr[i/num]
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

  def draw_board(board, arr)
    str = ""
    for k in 0..11 do
      self.draw_piece(str)
    end
    puts str
  end

  def draw_piece(str)
      (0..2).each do |i|
        str << "\t\t\t"
        (0..35).each do |j|
          case i
          when 0
            if j == 35
              str << "\n"
            elsif j % 6 == 5
              str << "|"
            else
              str << " "
            end
          when 1
           if j == 35
            str << "\n"
           elsif j % 6 == 5
            str << "|"
           elsif j % 6 == 2
             str << arr[]
           else
             str << " "
           end 
          when 2
           if j == 35
            str << "\n"
           elsif j % 6 == 5
            str << "|"
           else
             str << "_"
           end 
          end
      end
    end
 
  end

end

