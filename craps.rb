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
    puts "1) Start rollin' the dice."
    puts "2) Exit to Casino"
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
          player.wallet.deposit(@bet1)
          puts "$#{player.wallet.amount}"
          addict
      when @diesum == 2 || @diesum == 3 || @diesum == 12
        puts "You lose.".red
        @player.wallet.withdraw(@bet1)
        puts "#{@wallet.amount}"
        addict
      else
        puts "Bonus Round!".yellow
        @total1 = @diesum
        odds_bet
    end
  end

  def addict
    puts "Would you like to play again? Y/N"
    choice = gets.strip.downcase
    if choice == "y"
      comeout
    elsif choice == "n"

    else
      puts "Didn't quite getcha there, #{player.name}. Press 'Y' or 'N'"
      addict
    end
  end


  def odds_bet
    puts "Would you like to make an odds bet? Y/N"
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
      puts @diesum2 = @dice.show_sum
      case
        when @diesum2 == @total1
            puts "You Win!".green
            @player.wallet.deposit(@bet1)
            addict
        when @diesum2 == 7
          puts "You Lose.".red
          @player.wallet.withdraw(@bet1)
          addict
        else
          puts "Roll Again!".yellow
          b_round
      end
    end
  end
