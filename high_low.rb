require_relative 'player'

class HighLow
  attr_accessor :player
  def initialize(player)
    @player = player
    puts "Welcome to High/Low, #{player.name}!"
    initial_menu
  end

  def initial_menu
    puts "1) Place a starting bet"
    puts "2) Quit"
  end

  def during_menu
    puts "1) Continue, add winnings to current bet"
    puts "2) Collect winnings, place new bet"
    puts "3) Collect winnings and quit"
  end
end

player = Player.new
HighLow.new(player)
