require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class TestCustomer < MiniTest::Test

  def setup
    @customer1 = Customer.new("Bill", 15, 20)
    @customer2 = Customer.new("Will", 30, 12)
    @drink1 = Drink.new("Tenants", 3, 5)
    @drink2 = Drink.new("Best", 4, 6)
  end

  def test_customer_attributes
    assert_equal("Will", @customer2.name)
    assert_equal(15, @customer1.wallet)
    assert_equal(20, @customer1.age)
    assert_equal(0, @customer2.drunkenness)
  end

  def test_reduce_wallet__5
    @customer1.reduce_wallet(5)
    assert_equal(10, @customer1.wallet)
  end

  def test_reduce_wallet__minus_5
    @customer1.reduce_wallet(-5)
    assert_equal(15, @customer1.wallet)
  end


  # def test_buy_drink
  #   @customer1.buy_drink("Tenants")
  #   assert_equal(12, @customer1.wallet)
  # end
  #
  # def test_check_wallet__has_enough
  #   result = @customer1.check_wallet("Tenants")
  #   assert_equal(true, result)
  # end










end
