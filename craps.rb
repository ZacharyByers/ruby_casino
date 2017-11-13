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
          puts "#{@amount}"
      when @diesum == 2 || @diesum == 3 || @diesum == 12
        puts "You lose.".red
        @player.wallet.withdraw(@bet1)
        puts "#{@amount}"
      else
        puts "Bonus Round!".yellow
        @total1 = @diesum
        odds_bet
    end
  end

  def odds_bet
    puts "Would you like to make an odds bet? y/n"
    @answer = gets.strip.to_s
      case
        when @answer == 'y'
          puts "How much would you like to bet on your odds bet?"
          bet2 = gets.to_i
          @bet1 += bet2
          b_round
        when @answer =='n'
          b_round
        else
          puts "Invalid Input, please select 'y' or 'n'"
      end
    end

    def b_round
      @dice.roll
      @dice.show_dice
      puts
      @diesum2 = @dice.show_sum
      case
        when @diesum2 == @total1
            puts "You Win!".green
            @player.wallet.deposit(@bet1)
        when @diesum2 == 7
          puts "You Lose.".red
        else
          puts "Roll Again!".yellow
          b_round
      end
    end
  end

player = Player.new

Craps.new(player)
