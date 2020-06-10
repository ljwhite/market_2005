require 'pry'

class Vendor

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    inventory[item]
  end

  def stock(item, quantity)
    inventory[item] += quantity
  end

  def potential_revenue
    hash = inventory.transform_keys do |item|
      item.price.delete '$'
    end
    hash.sum {|k,v| k.to_f * v }
  end
end
