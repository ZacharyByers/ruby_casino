require_relative 'card'

class Deck
 # Getter and Setter methods for rank, suit and color
 attr_accessor :cards

 # Gets called when you call the new method to create an instance
 # deck = Deck.new
 def initialize
   @ranks = [
     {name: 'Ace', rank: 1},
     {name: 'Two', rank: 2},
     {name: 'Three', rank: 3},
     {name: 'Four', rank: 4},
     {name: 'Five', rank: 5},
     {name: 'Six', rank: 6},
     {name: 'Seven', rank: 7},
     {name: 'Eight', rank: 8},
     {name: 'Nine', rank: 9},
     {name: 'Ten', rank: 10},
     {name: 'Jack', rank: 11},
     {name: 'Queen', rank: 12},
     {name: 'King', rank: 13}
   ]
   @suits = %w(Spades Diamonds Clubs Hearts)
   @cards = []
   generate_deck
 end

 def shuffle_cards
  @cards.shuffle!
 end

 def generate_deck
   @suits.each do |suit|
     @ranks.size.times do |i|
       # Ternary Operator
       color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red'
       @cards << Card.new(@ranks[i], suit, color)
     end
   end
 end

 def choose_card
   @cards.sample
 end
end
 

deck.new
puts Deck