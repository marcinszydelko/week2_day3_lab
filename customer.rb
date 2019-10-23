class Customer

  attr_reader :name, :wallet, :age, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end

  def reduce_wallet(amount)
    @wallet -= amount
  end


end
