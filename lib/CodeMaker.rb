require_relative 'Player'
require 'pry-byebug'

class CodeMaker < Player
  POSSIBLE_CODE_COLOURS = 'RGBYMC'.split('')
  # Leave the line below like it is for now. When you make the Game file include it in but for now just use 'W' and 'B' for feedback from this class.
  @possible_feedback_colours = [9675.chr(Encoding::UTF_8), 9679.chr(Encoding::UTF_8)]
  attr_accessor :name, :code, :feedback

  def init(name='maker', c=true)
    super(name, c)
    @code = []
  end

  def make_code(c=true)
    @code = c ? self.make_code_rand : self.make_code_human 
  end
  #User must input a string containing 4 initials (All caps) from the available colours 
  def make_code_human()
    user_input = gets.chomp.split('')
    
    while (user_input & POSSIBLE_CODE_COLOURS) != user_input && user_input.length == 4
      puts 'Invalid code, please try again'
      user_input = gets.chomp.split('')
    end
    
    user_input
  end

  #Called by computer to generate a random code
  def make_code_rand()
    POSSIBLE_CODE_COLOURS.sample(4)    
  end

  #Way for the user to give feedback. The user must use 'W' for 'B' for white and black pegs respectively
  def give_feedback()
    user_input = gets.chomp

    if user_input.length > 1
      user_input = user_input.split('')
    end

    @feedback = user_input
  end

  def make_move(guess_arr)
    black_pegs = 0
    white_pegs = 0
    arr = [] 
    
    guess_arr.each_index { |i| black_pegs += 1 if guess_arr[i] == self.code[i] }
    (0..5).each { |n| arr << [self.code.count(POSSIBLE_CODE_COLOURS[n]), guess_arr.count(POSSIBLE_CODE_COLOURS[n])].min }
    white_pegs = arr.sum - black_pegs
    self.feedback = ('B' * black_pegs + 'W' * white_pegs + '*' * (4 - arr.sum)).split('')
  end
end
