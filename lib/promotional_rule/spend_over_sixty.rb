class SpendOverSixty < PromotionalRule
  
  def initialize
    @order = PromotionalRule::Order::TOTAL
  end
  
  def discount sum
    return 0 if sum < 60
    sum * 0.1
  end

end