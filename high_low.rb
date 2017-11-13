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

    choice = gets.to_i

    case choice
    when 1, 2, 3
      choice
    else
      puts "Invalid input."
      during_menu
    end
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
    if cards.last.rank[:name] == 'King' || cards.last.rank[:name] == 'Ace'
      play_game
    end

    puts "The first card is a(n) #{cards.last.rank[:name]}."

    while true
      win = false
      choice = higher_or_lower

      puts "Well, let's see!"

      cards << @deck.cards.delete(@deck.choose_card)

      puts "It's a #{cards.last.rank[:name]}!"

      case choice
      when 1
        if cards.last.rank[:rank] > cards[cards.length - 2].rank[:rank]
          puts "You win!"
          win = true
        else
          puts "Too bad."
        end
      when 2
        if cards.last.rank[:rank] < cards[cards.length - 2].rank[:rank]
          puts "You win!"
          win = true
        else
          puts "Too bad."
        end
      end

      if win
        choice = during_menu
        case choice
          when 1
            redo
          when 2
            initial_menu
          when 3
            puts "Come again!"
        end
      else
        puts "Play again? 1) Yes 2) No"
        choice = gets.to_i

        case choice
          when 1
            initial_menu
          when 2
            puts "Come again!"
          else
        end
      end
      break
    end
  end
end

#player = Player.new
#HighLow.new(player)
