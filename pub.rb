class Pub

   attr_reader :name, :till, :drinks, :stock

   def initialize(name, till, drinks, stock)
     @name = name
     @till = till
     @drinks = drinks
     @stock = stock
   end

   def increase_till(amount)
    @till += amount
   end

   def remove_drink(drink)
     @drinks.delete(drink)
   end

   def find_drink_by_name(drink_name)
     match = nil
     for drink in @drinks
       match = drink if drink.name == drink_name
     end
     return match
   end

   def check_customer_age(customer)
     legal_age = 18
     return true if customer.age >= legal_age
     return false
   end

   def sell_drink(drink, customer)
    if check_customer_age(customer) == true && customer_drunkenness(customer) == true
      remove_drink(drink)
      increase_till(drink.price)
    end
   end

   def customer_drunkenness(customer)
     allowed_level = 20
     return true if customer.drunkenness <= allowed_level
     return false
   end

   def sell_food(food)
     increase_till(food.price)
   end

   def stock_check(drink_name)
      for drink in @stock
        return drink[:stock] if drink[:drink_ref] == drink_name
      end
   end

end
