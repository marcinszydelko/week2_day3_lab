class Pub

 attr_reader :name, :till, :drinks

 def initialize(name, till)
   @name = name
   @till = till
   @drinks = []
 end

 def increase_till(amount)
  @till += amount
 end







end
