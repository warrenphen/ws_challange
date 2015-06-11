class Stock

  attr_accessor :name, :target_allocation, :actual_allocation, :shares_owned, :share_price

  def initialize(name, target_allocation, actual_allocation, shares_owned, share_price)
    
    @name = name
    @target_allocation = target_allocation
    @actual_allocation = actual_allocation
    @shares_owned = shares_owned
    @share_price = share_price
  end

  def dollar_value(shares_owned, share_price)
    shares_owned * share_price
  end

  def rebalance(target_allocation, actual_allocation)
    diff = target_allocation - actual_allocation

    if diff > 0
      buy_amount = ( (TOTAL * target_allocation / 100 - TOTAL * actual_allocation / 100) / share_price).to_i.abs
      print "Buy #{buy_amount} shares of #{name}. "
    elsif diff < 0
      sell_amount = ( (TOTAL * target_allocation / 100 - TOTAL * actual_allocation / 100) / share_price).to_i.abs
      print "Sell #{sell_amount} shares of #{name}. "
    end
  end

end

def total_investment(stocks)
  stocks.inject(:+)
end

Google = Stock.new("GOOG", 97, 50.96, 52, 98)
Apple = Stock.new("AAPL,", 1, 29.92, 136, 22)
Tesla = Stock.new("TSLA", 2, 19.12, 239, 8)

TOTAL = total_investment([Google.dollar_value(Google.shares_owned, Google.share_price), Apple.dollar_value(Apple.shares_owned, Apple.share_price), Tesla.dollar_value(Tesla.shares_owned, Tesla.share_price)])

Google.rebalance(Google.target_allocation,Google.actual_allocation)
Apple.rebalance(Apple.target_allocation,Apple.actual_allocation)
Tesla.rebalance(Tesla.target_allocation,Tesla.actual_allocation)
