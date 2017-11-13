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
      puts "Input bet amount"
      @bet = gets.to_f
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

  def higher_or_lower
    puts "Will the next card be:"
    puts "1) Higher"
    puts "2) Lower"

    choice = gets.to_i

    case choice
      when 1, 2
        choice
      else
        puts "Invalid input."
        higher_or_lower
    end
  end

  def play_game
    @deck.shuffle_cards
    cards = []
    cards << @deck.cards.delete(@deck.choose_card)
    play_game if cards.last.rank[:name] == 'King' || cards.last.rank[:name] == 'Ace'

    puts "The first card is a(n) #{cards.last.rank}."

    while true
      choice = higher_or_lower

      puts "Well, let's see!"

      cards << @deck.cards.delete(@deck.choose_card)

      break

    end
  end
end

#player = Player.new
#HighLow.new(player)
