class Checkout
  
  attr_accessor :items, :item_rules, :total_rules
  
  def initialize promotional_rules
    @items = []
    @item_rules = []
    @total_rules = []
    
    # Split the rules up depnding on when they're supposed to be applied
    promotional_rules.each do |rule|
      if rule.order == PromotionalRule::Order::ITEM
        @item_rules << rule
      elsif rule.order == PromotionalRule::Order::TOTAL
        @total_rules << rule
      end
    end
  end
  
  def scan item
    @items << item
  end
  
  def total
    total_discount = 0
    sum = items.inject(0){|sum, item| sum + item.price}
    
    # First apply the rules that change on an item level
    item_rules.each do |rule|
      sum -= rule.discount items
    end
    
    # Then apply the rules that change the total price
    total_rules.each do |rule|
      total_discount += rule.discount sum
    end
    
    sum -= total_discount
    sum.round(2)
  end
end

