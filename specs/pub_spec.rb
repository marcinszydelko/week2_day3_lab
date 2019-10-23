require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')
require_relative('../food')

class TestPub < MiniTest::Test


  def setup
    @drink1 = Drink.new("Tenants", 3, 5)
    @drink2 = Drink.new("Best", 4, 6)
    # @stock = [@drink1, @drink2]
    @pub1 = Pub.new("Ruby Inn", 1000,[@drink1, @drink2], [
      {drink_ref: "drink1",
       stock: 20},
       {drink_ref: "drink2",
        stock: 10}
     ])
    @customer1 = Customer.new("Bill", 15, 20)
    @customer2 = Customer.new("Will", 30, 12)
    @customer3 = Customer.new("Gill", 2, 30)
    @food1 = Food.new("Kebab", 5, 10)
    @food2 = Food.new("Crisps", 1, 2)


  end

  def test_pub_attributes
    assert_equal("Ruby Inn", @pub1.name)
    assert_equal(1000, @pub1.till)
    assert_equal([@drink1, @drink2], @pub1.drinks)
    assert_equal([{drink_ref: "drink1",
     stock: 20},
     {drink_ref: "drink2",
      stock: 10}], @pub1.stock)
  end

  def test_increase_till
    result = @pub1.increase_till(5)
    assert_equal(1005, @pub1.till)
  end

  def test_remove_drink
    @pub1.remove_drink(@drink1)
    assert_equal([@drink2], @pub1.drinks)
  end

  def test_find_drink_by_name__has_drink
    result = @pub1.find_drink_by_name("Tenants")
    assert_equal(@drink1, result)
  end

  def test_find_drink_by_name__no_drink_found
    result = @pub1.find_drink_by_name("Tea")
    assert_nil(result)
  end

  def test_check_customer_age
    result = @pub1.check_customer_age(@customer1)
    assert_equal(true, result)
  end

  def test_sell_drink
    @pub1.sell_drink(@drink1, @customer1)
    assert_equal([@drink2], @pub1.drinks)
    assert_equal(true, @pub1.check_customer_age(@customer1))
    assert_equal(1003, @pub1.till)
  end

  def test_sell_drink__too_young
    @pub1.sell_drink(@drink1, @customer2)
    assert_equal([@drink1, @drink2], @pub1.drinks)
    assert_equal(false, @pub1.check_customer_age(@customer2))
    assert_equal(1000, @pub1.till)
  end

  def test_sell_drink__customer_drunk
    10.times{@customer1.increase_drunkenness(@drink2)}
    @pub1.sell_drink(@drink2, @customer1)
    assert_equal([@drink1, @drink2], @pub1.drinks)
    assert_equal(true, @pub1.check_customer_age(@customer1))
    assert_equal(1000, @pub1.till)
  end

  def test_customer_drunkenness__pass
    assert_equal(true, @pub1.customer_drunkenness(@customer2))
  end

  def test_customer_drunkenness__doesnt_pass
    30.times{@customer2.increase_drunkenness(@drink1)}
    assert_equal(false, @pub1.customer_drunkenness(@customer2))
    assert_equal(150, @customer2.drunkenness)
  end

  def test_sell_food
    @pub1.sell_food(@food2)
    assert_equal(1001, @pub1.till)
  end

  def test_stock_check
    result = @pub1.stock_check("drink1")
    assert_equal(20, result)
  end

  def test_stock_return
    result = @pub1.stock_return("drink1")
    assert_equal({drink_ref: "drink1",
     stock: 20}, result)
  end

end
