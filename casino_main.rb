require 'pry'
require 'colorize'

require_relative 'slots'
require_relative 'high_low'
require_relative 'wallet'
require_relative 'player'
require_relative 'craps'
require_relative 'roulette'

class Casino
  attr_accessor :player, :running_tab

  def initialize
    @options = ['High/Low', 'Craps', 'Roulette', 'ATM', 'View Wallet', 'Exit']
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
        Roulette.new(@player)
      when 3
        atm
      when 4
        puts "You have $#{player.wallet.amount}"
      when 5
        `say toodle pip old bean`
        exit 0
      else
        puts "Invalid choice"
        menu
    end
    menu
  end
end

def atm
  puts "How much money do you want to withdraw?".light_blue
    withdrawl = gets.strip.to_i
    if withdrawl > 500
      puts "You can only take out $500 at a time.".red
      atm
    else
      player.wallet.amount = player.wallet.amount + withdrawl
      puts "Please wait while we process your transaction..."
      puts "Your transaction was successfull.".yellow
      puts "You now have $#{player.wallet.amount}".green
      menu
  end
end

Casino.new
