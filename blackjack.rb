require 'pry'
require 'colorize'
require_relative 'wallet'
require_relative 'deck'
require_relative 'player'
require_relative 'card'

class Blackjack
    attr_accessor :player, :deck
    def initialize(player)
      @bet = 0.0
      @deck = nil
      @player = player
      puts "Welcome to Blackjack, #{player.name}!"
      puts "I hope you brought money"
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
          play_blackjack
        when 2
        else
          puts "Invalid input"
          initial_menu
        end
      end
    def play_blackjack
        deck = Deck.new
        deck.shuffle_cards
        @playerhand
        @dealerhand
        @playing = true
        while @playing
            player_turn

            dealer_turn 
            if hand <= 16
                hit
              elsif hand >= 22
                puts dealer bust
              else
              end


            
        end
    
    end

  def hit
    # deals a card to either player or dealer
    cards.pop
  end

  def deal
    # init deal of 2 cards
    cards.pop
  end

  def backjack
    #game
    welcome
    deck
    shuffle_cards
    deal
  end
end

backjack
