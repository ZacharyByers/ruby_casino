class Craps
  attr_accessor :amount


  def initialize(player)
    @player = player
    puts "Welcome to Craps, #{player.name}"
    comeout
  end

  def comeout
    puts "Please place your bet on the pass-line."
    bet = gets.to_i
    d = Dice.new
# d.show_dice
# puts
# d.show_sum

  end





end

Craps.new
