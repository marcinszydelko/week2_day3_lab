require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')

class TestPub < MiniTest::Test


  def setup
    @drink1 = Drink.new("Tenants", 3, 5)
    @drink2 = Drink.new("Best", 4, 6)
    # @stock = [@drink1, @drink2]
    @pub1 = Pub.new("Ruby Inn", 1000,[@drink1, @drink2])

  end

  def test_pub_attributes
    assert_equal("Ruby Inn", @pub1.name)
    assert_equal(1000, @pub1.till)
    assert_equal([@drink1, @drink2], @pub1.drinks)
  end

  def test_increase_till
    result = @pub1.increase_till(5)
    assert_equal(1005, @pub1.till)
  end

  def test_remove_drink
    @pub1.remove_drink(@drink1)
    assert_equal([@drink2], @pub1.drinks)
  end

  def test_find_drink_by_name
    result = @pub1.find_drink_by_name("Tenants")
    assert_equal(@drink1, result)
  end










end
