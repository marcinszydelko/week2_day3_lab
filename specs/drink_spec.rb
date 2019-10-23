require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')


class TestDrink < MiniTest::Test


  def setup
    @drink1 = Drink.new("Tenants", 3, 5)
    @drink2 = Drink.new("Best", 4, 6)
  end

  def test_attributes
    assert_equal("Tenants", @drink1.name)
    assert_equal(4, @drink2.price)
    assert_equal(5, @drink1.alcohol_level)
  end





end
