require 'pry'

require_relative 'player'
require_relative 'deck'

class HighLow
  attr_accessor :player, :deck
  def initialize(player)
    @bet = 0
    @deck = Deck.new
    @player = player
    puts "Welcome to High/Low, #{player.name}!"
    initial_menu
  end

  def initial_menu
    puts "1) Place a bet"
    puts "2) Quit"

    choice = gets.to_i
    case choice
    when 1
      play_game
    when 2
    else
    end
  end

  def during_menu
    puts "1) Continue"
    puts "2) Collect winnings, start new game"
    puts "3) Collect winnings and quit"
  end

  def play_game
    @deck.shuffle_cards
    cards = []
    cards << @deck.cards.delete(@deck.choose_card)
    play_game if cards.last.rank == 'K' || cards.last.rank == 'A'


  end
end

#player = Player.new
#HighLow.new(player)
