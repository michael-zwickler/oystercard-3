class Oystercard
  attr_reader :balance

MAXIMUM_BALANCE = 90 

  def initialize
    @balance = 0
  end

  def top_up(num)
    fail 'You have reached your balance limit' if num + balance > MAXIMUM_BALANCE
    @balance += num
  end

end