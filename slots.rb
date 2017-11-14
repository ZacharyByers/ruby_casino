require 'colorize'

require_relative 'slots'
require_relative 'high_low'
require_relative 'wallet'
require_relative 'player'

class Slots
  attr_accessor :player, :casino

  def initialize(player, casino)
    @player = player
    @casino = casino
    puts "Welcome to the Slot Machines #{player.name}!".light_blue
    puts "You have $#{player.wallet} to play with.".green
    slot_menu
  end

  def slot_menu
    puts "---- SLOTS ----".green
    puts "1) Insert Bet"
    puts "2) Pull The Lever"
    puts "3) Cashout And Return To The Casino"
    puts "Pick an option. (1-3)".yellow

    case @casino.gets.to_i
      when 1
        insert_bet
      when 2
        pull_lever
      when 3
        puts "You have $#{player.wallet}.".green
        puts "Thank you for playing the Slots #{player.name}! Come again!".yellow
        @casino.menu
      else
        puts "\nPlease pick a valid option.".red
        slot_menu
      end
  end

  def insert_bet
    puts "How much do you want to bet?".light_blue
    @player_bet = @casino.gets.to_f
    if @player_bet == 0
      puts "You can't spin without a bet!".red
      insert_bet
    elsif @player_bet > player.wallet
      puts "lmao you broke".red
      puts "There's always the ATM, but you don't need more money you need help.".yellow
      exit
    else
      puts "Your Bet: $#{@player_bet}".green
      slot_menu
    end
  end

  def pull_lever
    if @player_bet == nil
      puts "You need to make a bet first #{player.name}!".red
      slot_menu
    else
      slot1 = ["Orange", "Banana", "Cherry", "Strawberry", "Pineapple"]
      slot2 = ["Orange", "Banana", "Cherry", "Strawberry", "Pineapple"]
      slot3 = ["Orange", "Banana", "Cherry", "Strawberry", "Pineapple"]
      shuffle_machine = []
      puts "Spinning...".green
        option1 = slot1[rand(0..4)]
        shuffle_machine << option1
        option2 = slot2[rand(0..4)]
        shuffle_machine << option2
        option3 = slot3[rand(0..4)]
        shuffle_machine << option3
          print "#{shuffle_machine[0]} |".yellow
          print " #{shuffle_machine[1]} |".yellow
          puts " #{shuffle_machine[2]}".yellow
          shuffle_machine = shuffle_machine.uniq
          shuffle_machine = shuffle_machine.count
      if shuffle_machine == 1
        jackpot
      elsif shuffle_machine == 2
        winnings
      else
        loser
      end
    end
  end

  def jackpot
    player.wallet = player.wallet + (@player_bet * 4)
    puts "*** JACKPOT ***".green
    puts "You won $#{@player_bet * 4}!! You now have $#{player.wallet}".yellow
    play_again
  end

  def winnings
    player.wallet = player.wallet + (@player_bet * 1.5)
    puts "You won $#{@player_bet * 1.5}!".green
    puts "You now have $#{player.wallet}".light_blue
    play_again
  end

  def loser
    player.wallet = player.wallet - (@player_bet)
    puts "Sorry, you lose!".red
    puts "You now have $#{player.wallet}".purple
    play_again
  end

  def play_again
    puts "Do you want to play again #{player.name}? Y/N".yellow
    player_choice = @casino.gets.strip.downcase
    if player_choice == 'y'
      slot_menu
    else
      puts "Thanks for playing Slots! Come back soon!".green
      @casino.menu
    end
  end
end
