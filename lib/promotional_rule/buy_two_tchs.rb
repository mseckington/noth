class BuyTwoTchs < PromotionalRule
  
  def initialize
    @order = PromotionalRule::Order::ITEM
  end
  
  def discount items
    item_count = items.count{ |item| item.code == "001"}
    return 0 if item_count < 2
    item_count * 0.75
  end

end