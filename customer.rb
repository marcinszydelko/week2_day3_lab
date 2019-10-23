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

  def check_wallet(amount)
    return true if amount <= @wallet
    return false
  end

  def buy_drink(drink, pub)
    chosen_drink = pub.find_drink_by_name(drink)
    return "not enough funds" if check_wallet(chosen_drink.price) == false
    pub.sell_drink(chosen_drink, self)
    reduce_wallet(chosen_drink.price)
    increase_drunkenness(chosen_drink)
  end

  def increase_drunkenness(drink)
    @drunkenness += drink.alcohol_level
  end

  def eat_food(food)
    @drunkenness -= food.rejuvenation_level
  end

  def buy_food(food)
    if check_wallet(food.price) == true
      reduce_wallet(food.price)
      eat_food(food)
    end

  end


end
