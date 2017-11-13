require 'pry'
require 'colorize'

require_relative 'slots'
require_relative 'high_low'
require_relative 'wallet'
require_relative 'player'

class Casino
  attr_accessor :player
  @options = ['High/Low', 'Exit']
  def initialize
    puts "Welcome to the Ruby Casino!".green
    @player = Player.new
  end

  def menu
    @options.each_with_index { |opt, i| puts "#{i + 1}) #{opt}" }
    choice = gets.to_i - 1
    case choice
      when 0
        HighLow.new(@player, self)
      when 1
        puts "k bye"
        exit 0
      else
        puts "Invalid choice"
        menu
    end

    end
  end
end


Casino.new
