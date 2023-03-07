class Vendor
  attr_reader :name, 
              :inventory
  
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

end
