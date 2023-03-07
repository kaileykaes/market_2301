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
end
