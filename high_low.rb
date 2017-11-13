require 'pry'
require 'colorize'

require_relative 'player'
require_relative 'deck'
require_relative 'high_low_payout_tables'

class HighLow
  attr_accessor :player, :deck
  def initialize(player)
    @bet = 0.0
    @deck = nil
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
      @player.wallet.withdraw(@bet)
      play_game
    when 2
    else
      puts "Invalid input"
      initial_menu
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
    puts "Will the next card be:".yellow
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

  def get_multiplier(rank, choice)
    rank = rank.to_s
    case choice
      when 1
        Higher_payouts[rank]
      when 2
        Lower_payouts[rank]
    end
  end

  def play_game
    @deck = Deck.new
    @deck.shuffle_cards
    cards = []

    loop do
      cards << @deck.cards.delete(@deck.choose_card)
      if cards.last.rank[:name] != 'King' && cards.last.rank[:name] != 'Ace'
        break
      end
    end
    puts "The first card is a(n) #{cards.last.rank[:name]}.".yellow

    while true
      payout_multiplier = 0
      win = false
      choice = higher_or_lower

      puts "Well, let's see!".cyan

      cards << @deck.cards.delete(@deck.choose_card)

      puts "It's a #{cards.last.rank[:name]}!".yellow

      case choice
        when 1
          if cards.last.rank[:rank] > cards[cards.length - 2].rank[:rank]
            `say hooray`
            puts "You win!".green
            payout_multiplier = get_multiplier(cards[cards.length - 2].rank[:rank], 1)
            @bet = (@bet * payout_multiplier)
            win = true
          else
            `say dagnabbit`
            puts "Too bad.".red
          end
        when 2
          if cards.last.rank[:rank] < cards[cards.length - 2].rank[:rank]
            `say hooray`
            puts "You win!"
            payout_multiplier = get_multiplier(cards[cards.length - 2].rank[:rank], 2)
            @bet += (@bet * payout_multiplier)
            win = true
          else
            `say dagnabbit`.green
            puts "Too bad.".red
          end
      end

      if cards.last.rank[:rank] == cards[cards.length - 2].rank[:rank]
        puts "Even money."
        win = true
      end

      if win
        choice = during_menu
        case choice
          when 1
            if cards.last.rank[:name] == 'King' || cards.last.rank[:name] == 'Ace'
              puts "Oh, we're at an extreme, gotta reshuffle!".pink
              play_game
            end
            redo
          when 2
            @player.wallet.deposit(@bet)
            puts "You won $#{@bet}!"
            initial_menu
          when 3
            @player.wallet.deposit(@bet)
            puts "You won $#{@bet}!"
            puts "Come again!"
        end
        break
      else
        puts "Play again? 1) Yes 2) No"
        choice = gets.to_i

        case choice
          when 1
            initial_menu
          when 2
            puts "Come again!".yellow
          else
        end
        break
      end
      break
    end
  end
end
