require 'spec_helper'

RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")
    @rocky_mountain_fresh = Vendor.new("Rocky Mountain Fresh")
    @ba_nom_a_nom = Vendor.new("Ba-Nom-a-Nom")
    @palisade_peach_shack = Vendor.new("Palisade Peach Shack")
    @item1 = Item.new({
      name: 'Peach', 
      price: "$0.75"})
    @item2 = Item.new({
      name: 'Tomato', 
      price: '$0.50'
      })
    @item3 = Item.new({
      name: "Peach-Raspberry Nice Cream", 
      price: "$5.30"
      })
    @item4 = Item.new({
      name: "Banana Nice Cream", 
      price: "$4.25"
      })
    @rocky_mountain_fresh.stock(@item1, 35)
    @rocky_mountain_fresh.stock(@item2, 7)
    @ba_nom_a_nom.stock(@item4, 50)
    @ba_nom_a_nom.stock(@item3, 25)
    @palisade_peach_shack.stock(@item1, 65)
  end

  it 'exists' do
    expect(@market).to be_a(Market)
  end

  it 'has attributes' do
    expect(@market.name).to eq("South Pearl Street Farmers Market")
    expect(@market.vendors).to eq([])
  end

  it 'can add vendors' do
    @market.add_vendor(@rocky_mountain_fresh)
    @market.add_vendor(@ba_nom_a_nom)
    @market.add_vendor(@palisade_peach_shack)
    expect(@market.vendors).to eq([@rocky_mountain_fresh, @ba_nom_a_nom, @palisade_peach_shack])
  end

  it 'can return vendor names' do
    @market.add_vendor(@rocky_mountain_fresh)
    @market.add_vendor(@ba_nom_a_nom)
    @market.add_vendor(@palisade_peach_shack)
    expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  end
  
  it 'can find vendors that sell items' do
    @market.add_vendor(@rocky_mountain_fresh)
    @market.add_vendor(@ba_nom_a_nom)
    @market.add_vendor(@palisade_peach_shack)
    expect(@market.vendors_that_sell(@item1)).to eq([@rocky_mountain_fresh, @palisade_peach_shack])
    expect(@market.vendors_that_sell(@item4)).to eq([@ba_nom_a_nom])
  end
  
  it 'can find vendors that sell items' do
    @market.add_vendor(@rocky_mountain_fresh)
    @market.add_vendor(@ba_nom_a_nom)
    @market.add_vendor(@palisade_peach_shack)
    expect(@market.sorted_item_list).to be_a(Array)
    expect(@market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
  end

  it 'can check total inventory' do
    @market.add_vendor(@rocky_mountain_fresh)
    @market.add_vendor(@ba_nom_a_nom)
    @market.add_vendor(@palisade_peach_shack)
    expect(@market.total_inventory).to be_a(Hash)
    expect(@market.total_inventory).to eq({
      @item1 => {total: 100, vendors: ["Rocky Mountain Fresh", "Palisade Peach Shack"]},
      @item2 => {total:7, vendors: ["Rocky Mountain Fresh"]},
      @item3 => {total: 25, vendors: ["Ba-Nom-a-Nom"]},
      @item4 => {total: 50, vendors: ["Ba-Nom-a-Nom"]}
      })
  end 

  it 'find overstocked items' do
    @market.add_vendor(@rocky_mountain_fresh)
    @market.add_vendor(@ba_nom_a_nom)
    @market.add_vendor(@palisade_peach_shack)
    @market.total_inventory
    expect(@market.overstocked_items).to eq([@item1])
  end
end