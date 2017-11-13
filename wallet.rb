class Wallet
  attr_accessor :amount
  def initialize(amount)
    @amount = amount
  end

  def withdraw(amount)
    @amount -= amount
  end

  def deposit(amount)
    @amount += amount
  end
end
