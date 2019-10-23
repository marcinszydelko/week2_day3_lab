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
     for drink in @drinks
       if drink.name == drink_name
         return drink
       end
     end 
   end



end
