require_relative 'pry'
require_relative 'colorize'
require_relative 'wallet'
require_relative 'Deck'
require_relative 'player'
require_relative 'card'

def welcome
   #welcome statment
   puts "Welcome to Blackjack #{@name}"
   puts "You will be playing against the dealer"

def dealer
# computer or dealer


end



def hit
# deals a card to either player or dealer

end

def deal
    # init deal of 2 cards
    cards.pop
    end 
    
def backjack
    #game 
    welcome
    Deck.new
    shuffle_cards
    deal

end

