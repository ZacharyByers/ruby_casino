class Dice
 def initialize
   roll
 end

 def roll
   @die1 = rand(1..6)
   @die2 = rand(1..6)
 end

 def show_dice
   print "Die1: ", @die1, " Die2: ", @die2
 end

 def show_sum
   print "Sum of dice is ", @die1 + @die2, ".\n"
   diesum = @die1 + @die2
   return diesum
  end
end

d = Dice.new
