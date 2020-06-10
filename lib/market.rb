require 'pry'
class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    vendors << vendor
  end

  def vendor_names
    vendors.map {|vendor| vendor.name }
  end

  def vendors_that_sell(item)
  #   item_obj = nil
  #   vendors.each do |vendors|
  #     vendors.inventory.each do |inv_item, qty|
  #       item_obj = inv_item if inv_item.name == item
  #     end
  #     item_obj
  #   end
  # #  item_obj #= item_obj.first
    vendors.select {|vendor| vendor.inventory.include?(item) }
  end

  def total_inventory
    hash = Hash.new(0)
    hash2 = Hash.new(0)
    hash3 = Hash.new(0)
    acc = []
    vendors.each do |vendor|
      vendor.inventory.each do |item, qty|
        hash[item] += qty
        acc << vendor if vendor.inventory.include?(item)
        hash2[item] = acc
      end
    end
    hash.transform_values do |qty|
      hash3[qty] = "vendor"
    end
    hash2
  end

  def sorted_item_list
    acc = []
    vendors.each do |vendor|
      vendor.inventory.each do |item, qty|
        acc << item.name
      end
    end
    acc.uniq.sort
  end
end
