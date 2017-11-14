require 'pry'
require 'colorize'
require_relative 'wallet'
require_relative 'deck'
require_relative 'player'
require_relative 'card'

def welcome
   #welcome statment
   puts "Welcome to Blackjack #{@name}"
   puts "You will be playing against the dealer"

end
def dealer
# computer or dealer
  if hand <= 16 
    hit
  elsif hand >= 22 
    puts dealer bust
  else 
end
Deck.new = deck


def hit
# deals a card to either player or dealer
 cards.pop
end

def deal
    # init deal of 2 cards
    cards.pop(2)
end 
    
def backjack
    #game 
    welcome
    deck
    shuffle_cards
    deal    

end

backjack