class HighLow
  attr_accessor :player
  def initialize(player)
    @player = player
    puts "Welcome to High/Low, #{player.name}!"
  end
end
