class Customer

  attr_reader :name, :wallet, :age, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end

  def reduce_wallet(amount)
    @wallet -= amount if amount > 0
  end

  def check_wallet(drink, pub)
    chosen_drink = pub.find_drink_by_name(drink)
    return true if chosen_drink.price <= @wallet
    return false
  end

  def buy_drink(drink, pub)
    chosen_drink = pub.find_drink_by_name(drink)
    reduce_wallet(chosen_drink.price)
    pub.remove_drink(chosen_drink)
    pub.increase_till(chosen_drink.price)
  end


end
