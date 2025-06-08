class OptimalPlay

# Method to change from number strings to plays
  def make_play()
    dict = {'0' => 'R', '1' => 'G', '2' => 'B', '3' => 'Y', '4' => 'O', 5 => 'P'} 
    arr = []

    (0..1295).each do |num|
      arr << change_base(num, 6, 4).tr('012345', 'RGBYOP')
    end
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
