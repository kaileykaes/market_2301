class Market
  attr_reader :name, 
              :vendors
  
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    names = []
    @vendors.each do |vendor|
      names << vendor.name
    end
    names
  end

  def vendors_that_sell(item)
    sellers = []
    @vendors.map do |vendor|
      if vendor.inventory.include?(item)
        sellers << vendor
      end
    end
    sellers
  end

  def sorted_item_list 
    item_names = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item, value|
        item_names << item.name
      end
    end
    item_names.sort
  end

  def total_inventory  
    errythang = {}
    @vendors.map do |vendor|
      vendor.inventory.each do |item, v|
        errythang[item] = {total: 0, vendors: []} unless errythang.has_key?(item)
        errythang[item][:total] += vendor.inventory[item]
        errythang[item][:vendors] << vendor.name unless errythang[item].has_key?(vendor) 
      end
    end
    errythang
  end

  def overstocked_items
    too_many = []
    total_inventory.each do |item, val|
      too_many << item if val[:total] > 50 && val[:vendors].length > 1
    end
    too_many
  end
end
