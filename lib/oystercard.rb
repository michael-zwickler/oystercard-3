class Oystercard
  attr_reader :balance

  MAXIMUM_BALANCE = 90 
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(num)
    fail 'You have reached your balance limit' if num + @balance > MAXIMUM_BALANCE
    @balance += num
  end

  def deduct(num)
    @balance -= num
  end

  def in_journey?
    @in_journey 
  end 

  def touch_in
    fail 'Insufficient funds on card' if @balance < MINIMUM_BALANCE

    @in_journey = true 
  end 

  def touch_out 
    @in_journey = false
  end 

end