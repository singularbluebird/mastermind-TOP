require_relative 'Player'

class CodeMaker < Player
  POSSIBLE_CODE_COLOURS = 'RGBYOP'.split('')
  # Leave the line below like it is for now. When you make the Game file include it in but for now just use 'W' and 'B' for feedback from this class.
  @possible_feedback_colours = [9675.chr(Encoding::UTF_8), 9679.chr(Encoding::UTF_8)]
  attr_accessor :name, :code, :feedback

  def init(name='maker')
    @name = name
    @code = []
  end

  #User must input a string containing 4 initials (All caps) from the available colours 
  def make_code()
    user_input = gets.chomp.split('')
    
    while (user_input & POSSIBLE_CODE_COLOURS) != user_input && user_input.length == 4
      puts 'Invalid code, please try again'
      user_input = gets.chomp.split('')
    end
    
    @code = user_input
  end

  #Called by computer to generate a random code
  def make_code_rand()
    @code = POSSIBLE_CODE_COLOURS.sample(4)    
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
    ans = []
    arr = @code
    guess_arr.each_index do |i|
      if guess_arr[i] in arr
        if guess_arr[i] == @code[i]
          ans << 'B'
        else
          ans << 'W'
        end
      else
        ans << '*'
      end
      arr.shift
    end

    @feedback = ans.shuffle
  end
end
