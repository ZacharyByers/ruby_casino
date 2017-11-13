require 'pry'
require 'colorize'

require_relative 'slots.rb'
require_relative 'high_low.rb'
require_relative 'wallet.rb'
require_relative 'player.rb'

class Casino
  attr_accessor :player
  def initialize
    puts "Welcome to the Ruby Casino!".green
    @player = Player.new
  end
end


Casino.new
