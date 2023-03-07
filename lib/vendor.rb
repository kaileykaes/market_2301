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
    @inventory[item] = 0
    @inventory[item] += num
  end
  @inventory
end
