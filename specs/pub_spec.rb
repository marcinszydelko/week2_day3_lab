require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')

class TestPub < MiniTest::Test


  def setup
    @pub1 = Pub.new("Ruby Inn", 1000)
  end

  def test_pub_attributes
    assert_equal("Ruby Inn", @pub1.name)
    assert_equal(1000, @pub1.till)
    assert_equal([], @pub1.drinks)
  end

  def test_increase_till
    result = @pub1.increase_till(5)
    assert_equal(1005, @pub1.till)
  end









end
