require('minitest/autorun')
require('minitest/rg')
require_relative('../food')


class TestFood < MiniTest::Test

  def setup
    @food1 = Food.new("Kebab", 5, 10)
    @food2 = Food.new("Crisps", 1, 2)
  end

  def test_food_attributes
    assert_equal("Kebab", @food1.name)
    assert_equal(1, @food2.price)
    assert_equal(10, @food1.rejuvenation_level)
  end 










end
