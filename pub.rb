class Pub

   attr_reader :name, :till, :drinks

   def initialize(name, till, drinks)
     @name = name
     @till = till
     @drinks = drinks
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


end
