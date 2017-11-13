require_relative 'wallet'

class Player
  attr_accessor :name, :age, :wallet
  MIN_AGE = 21

  def initialize
    @wallet = Wallet.new
    puts "What is your name, player?".yellow
      @name = gets.strip
    puts "What is your age?".yellow
      @age = gets.to_i
      age_verification
  end

  def running_tab
    puts "How much money are you playing with, #{@name}?".yellow
      wallet.amount = gets.to_f
      if wallet.amount == 0
        puts "Gonna need some pesos to play at this joint, hombre.".red
        running_tab
      else
        puts "You have $#{wallet.amount}! Let's play!".green
    end
  end

  def age_verification
    if @age < MIN_AGE
      `say skeedaddle kid`
      exit 0
    else
      running_tab
    end
  end
end
