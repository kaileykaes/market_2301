require 'spec_helper'

RSpec.describe Vendor do
  before(:each) do
    @item1 = Item.new({
      name: 'Peach', 
      price: "$0.75"})
    @item2 = Item.new({
      name: 'Tomato', 
      price: '$0.50'
      })
    @vendor = Vendor.new("Rocky Mountain Fresh")  
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




end