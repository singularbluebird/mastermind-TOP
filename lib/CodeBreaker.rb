require_relative 'Player'
class CodeBreaker < Player
  attr_accessor :name, :guess, :possible_guesses

  def init(name='breaker')
    @name = name
  end

  def make_move()
    @guess = gets.chomp.split('')
  end

  def make_optimal_guess()
    if possible_guesses.length == 1296
      @guess = possible_guesses[7]
    end
  end

# Method to change from number strings to plays
  def make_play()
    dict = {'0' => 'R', '1' => 'G', '2' => 'B', '3' => 'Y', '4' => 'O', 5 => 'P'} 
    arr = []

    (0..1295).each do |num|
      arr << change_base(num, 6, 4).tr('012345', 'RGBYOP')
    end
    @possible_guesses = arr
  end

# Method to change base
  def change_base(n, base, len)
    if n == 0
      return "0" * len
    end

    digits = []
    while n > 0
      digits.unshift(n % base)
      n /= base
    end

    "0" * (len - (digits.length)) + digits.join 
  end
end
