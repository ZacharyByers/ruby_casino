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

  def check_score(hand)
    total = 0
    has_ace = false
    hand.each do |card|
      if card.rank[:rank] == 1
        has_ace = true
        total += 11
      elsif card.rank[:rank] >=10
        total += 10
      else
        total += card.rank[:rank]
      end
    end
    if has_ace and total > 20
      total -= 10
    end
    total
  end

  def dealer_turn
    score = check_score @dealerhand
    if score <= 16
      hit
    elsif hand >= 22
      puts dealer bust
    else
    end
  end

  def print_cards(hand)
    hand.each do |card|
        rank = card.rank[:rank]
        name = card.rank[:name]
      if rank == 1
        puts " #{name} #{rank}"
    
      elsif rank >=10
        rank = 10
        puts " #{name} #{rank}"
      else
        puts " #{name} #{rank}"
      end
    end

  end

  def player_turn
    score = check_score @playerhand
    #print out cards
    print_cards @playerhand
    #asks stay or hit
    puts "s for stay of h for hit"

    #get input
    choice = gets.strip.downcase
    if choice == "h"
      @playerhand.push hit
      score = check_score @playerhand
      if score >= 22
        endgame "dealer"
      elsif score == 21
        endgame "player"
      end
    end
    #if hit add card to deck

    #check new score to check if bust or win
    #if stay end turn

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
      #when 2
    else
      puts "Invalid input"
      initial_menu
    end
  end

  def play_blackjack
    @deck = Deck.new
    @deck.shuffle_cards
    @playerhand = deal
    @dealerhand = deal
    @playing = true
    while @playing
      player_turn

      dealer_turn
    end
  end

  def hit
    # deals a card to either player or dealer
    @deck.cards.pop
  end

  def deal
    # init deal of 2 cards
    @deck.cards.pop(2)
  end

end
Blackjack.new Player.new