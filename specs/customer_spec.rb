require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class TestCustomer < MiniTest::Test

  def setup
    @customer1 = Customer.new("Bill", 15, 20)
    @customer2 = Customer.new("Will", 30, 12)
  end

  def test_customer_attributes
    assert_equal("Will", @customer2.name)
    assert_equal(15, @customer1.wallet)
    assert_equal(20, @customer1.age)
    assert_equal(0, @customer2.drunkenness)
  end













end