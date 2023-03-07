require 'spec_helper'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh") 
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
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
  end

  it 'exists' do
    expect(@vendor).to be_a(Vendor)
  end

  it 'has attributes' do
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'has an inventory' do
    expect(@vendor.inventory).to eq({})
  end

  it 'can check the stock' do
    expect(@vendor.check_stock(@item1)).to eq(0)
  end

  it 'can stock items' do
    @vendor.stock(@item1, 30)
    expect(@vendor.inventory).to eq({@item1 => 30})
  end

  it 'can stock more items' do
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)
    expect(@vendor.inventory).to eq({@item1 => 55})
  end

  it 'can stock items of differing types' do
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)
    @vendor.stock(@item2, 12)
    expect(@vendor.inventory).to eq({@item1 => 55, @item2 => 12})
  end

  it 'can stock items of differing types' do
    @vendor.stock(@item1, 30)
    @vendor.stock(@item1, 25)
    @vendor.stock(@item2, 12)
    expect(@vendor.inventory).to eq({@item1 => 55, @item2 => 12})
  end

  it 'can find the potential revenue of items' do
    @vendor1.stock(item1, 35)
    @vendor1.stock(item2, 7)
    @vendor2.stock(item4, 50)
    @vendor2.stock(item3, 25)
    @vendor3.stock(item1, 65)
    expect(@vendor1.potential_revenue).to eq(29.75)
    expect(@vendor2.potential_revenue).to eq(345.00)
    expect(@vendor1.potential_revenue).to eq(48.75)
  end


end