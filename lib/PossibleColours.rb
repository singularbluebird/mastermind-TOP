require 'colorize'

module PossibleColours

  def get_poss_make_c(chr)
    possible_make_colours = {'B': 9675.chr(Encoding::UTF_8), 'W': 9679.chr(Encoding::UTF_8)} 

    return possible_make_colours[chr]
  end

  def get_poss_guess_c(chr)
    possible_guess_colours = {'R': 9679.chr(Encoding::UTF_8).colorize(:red), 'G': 9679.chr(Encoding::UTF_8).colorize(:green), 'B': 9679.chr(Encoding::UTF_8).colorize(:blue), 'Y': 9679.chr(Encoding::UTF_8).colorize(:yellow), 'O': 9679.chr(Encoding::UTF_8).colorize(:orange), 'P':9679.chr(Encoding::UTF_8).colorize(:pink) }
 
    return possible_guess_colours[chr]
  end
end
