class Vendor
  attr_reader :name
  attr_accessor :inventory
  
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
      if @inventory.include?(item)
        return @inventory[item]
      else
        @inventory[item] = 0
      end
  end 

  def stock(item, num)
    if @inventory.has_key?(item)
      @inventory[item] += num
    else 
      @inventory[item] = 0
      @inventory[item] += num
    end
  @inventory
  end

  def potential_revenue
    price_amount = {}
    @inventory.each do |item, amount|
      price_amount[item.price.delete('$').to_f] = amount
    end
    revenues = []
    price_amount.map do |price, amount|
      revenues << price * amount
    end
    revenues.sum
  end
end
