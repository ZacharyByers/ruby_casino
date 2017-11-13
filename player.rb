require_relative 'wallet'

class Player
  attr_accessor :name, :age, :wallet
  MIN_AGE = 21
  def initialize
    puts "What is your name, player?"
    @name = gets.strip
    puts "What is your age?"
    @age = gets.to_i
    age_verification
    puts "How much money are you playing with?"
    amount = gets.to_f
    @wallet = Wallet.new(amount)

  end

  def age_verification
    if @age < MIN_AGE
      puts "Skedaddle, kid."
      exit 0
    end
  end
end
