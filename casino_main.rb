require 'pry'
require 'colorize'

require_relative 'slots.rb'
require_relative 'high_low.rb'
require_relative 'wallet.rb'
require_relative 'player.rb'

class Casino
  def initialize
    puts "Welcome to the Ruby Casino!".green
    puts "What is your name, player?"
    name = gets.strip
    #create a new player instance, probably put the name
    #in the Player initialize
  end
end


Casino.new
