class Player
  attr_accessor :name, :p_pos, :n_pos, :computer

 def init(nam, c)
   @name = nam
   @n_pos = nil
   @p_pos = nil
   @computer = c
 end 

 # This is a stub method meant to be overwritten by descendant classes
 def make_move()
 end
end
