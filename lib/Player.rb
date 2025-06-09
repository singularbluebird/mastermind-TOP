class Player
  attr_accessor :name, :p_pos, :n_pos

 def init(nam)
   @name = nam
   @n_pos = nil
   @p_pos = nil
 end 

 # This is a stub method meant to be overwritten by descendant classes
 def make_move()
 end
end
