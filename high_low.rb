class HighLow
  attr_accessor :player
  def initialize(player)
    @player = player
    puts "Welcome to High/Low, #{player.name}!"
    menu
  end

  def initial_menu
    puts "1) Place a bet"
    puts "2) "
  end
end
