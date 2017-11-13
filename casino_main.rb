require 'pry'
require 'colorize'

require_relative 'slots'
require_relative 'high_low'
require_relative 'wallet'
require_relative 'player'
require_relative 'craps'

class Casino
  attr_accessor :player

  def initialize
    @options = ['High/Low', 'Craps', 'Exit']
    puts "Welcome to the Ruby Casino!".green
    @player = Player.new
    menu
  end

  def menu
    puts "Choose a game!".yellow
    @options.each_with_index { |opt, i| puts "#{i + 1}) #{opt}" }
    choice = gets.to_i - 1
    case choice
      when 0
        HighLow.new(@player)
      when 1
        Craps.new(@player)
      when 2
        puts "k bye"
        exit 0
      else
        puts "Invalid choice"
        menu
    end
    menu
  end
end


Casino.new
