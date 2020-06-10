require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item.rb'
require_relative '../lib/vendor.rb'
require 'pry'

class VendorTest < Minitest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_it_has_readable_attributes
    assert_equal ({}), @vendor.inventory
  end

  def test_it_can_check_stock
    assert_equal 0, @vendor.check_stock(@item1)
  end

  def test_it_can_stock_item
    @vendor.stock(@item1, 30)
    actual = @vendor.check_stock(@item1)
    assert_equal 30, actual
    @vendor.stock(@item1, 10)
    assert_equal 40, @vendor.check_stock(@item1)
  end

  def test_vendor_can_check_inventory
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)
    @vendor.stock(@item2, 12)
    expected = {@item1 => 55,
                @item2 => 12}
    actual = @vendor.inventory
    assert_equal expected, actual
  end

  def test_it_can_find_potential_revenue
    @vendor.stock(@item1, 10)
    @vendor.stock(@item2, 10)

    actual = @vendor.potential_revenue
    expected = 12.50
    assert_equal expected, actual
  end
end
