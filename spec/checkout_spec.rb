require 'spec_helper'

describe Checkout do
  before do
    @item1 = Item.new "001", "Travel Card Holder", 9.25
    @item2 = Item.new "002", "Personalised cufflinks", 45.00
    @item3 = Item.new "003", "Kids T-shirt", 19.95
    
    @promotional_rules = [BuyTwoTchs.new, SpendOverSixty.new]
    
  end
  
  it "should pass test data 1 (001, 002, 003)" do
    co = Checkout.new(@promotional_rules)
    
    co.scan(@item1)
    co.scan(@item2)
    co.scan(@item3)
    price = co.total
    
    expect(price).to be == 66.78
  end
  
  it "should pass test data 2 (001, 003, 001)" do
    co = Checkout.new(@promotional_rules)
    
    co.scan(@item1)
    co.scan(@item3)
    co.scan(@item1)
    price = co.total
    
    expect(price).to be == 36.95
  end
  
  it "should pass test data 3 (001, 002, 001, 003)" do
    co = Checkout.new(@promotional_rules)
    
    co.scan(@item1)
    co.scan(@item2)
    co.scan(@item1)
    co.scan(@item3)
    price = co.total
    
    expect(price).to be == 73.76
  end
  
end