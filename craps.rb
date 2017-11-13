require_relative 'wallet'
require_relative 'player'
require_relative 'rollingdice'
require 'colorize'
require 'pry'

class Craps
  attr_accessor :amount, :player, :rollingdice


  def initialize(player)
    @player = player
    @dice = Dice.new
    puts "Welcome to Craps, #{player.name}!".blue
    opening
  end

  def opening
    puts "1) Place your bet."
    puts "2) Quit"
    comeout
  end

  def comeout
    choice = gets.to_i
    case choice
      when 1
        puts "Please declare the amount you wish to bet."
        @bet1 = gets.to_f
        roll_1
      when 2
        exit
        menu
    end
  end

  def roll_1
    @dice.roll
    @dice.show_dice
    puts
    @diesum = @dice.show_sum
    case
      when @diesum == 7 || @diesum == 11
          puts "You win!".green
          @player.wallet.deposit(@bet1)
          puts @amount
      when @diesum == 2 || @diesum == 3 || @diesum == 12
        puts "You lose.".red
        @player.wallet.withdraw(@bet1)
        puts @amount
      else
        puts "Bonus Round!".yellow
        b_round
    end
  end

  def b_round
    
  end

end

player = Player.new

Craps.new(player)
