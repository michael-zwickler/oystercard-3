class Oystercard
  attr_reader :balance
  attr_reader :in_journey

  MAXIMUM_BALANCE = 90 
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(num)
    fail 'You have reached your balance limit' if num + @balance > MAXIMUM_BALANCE
    @balance += num
  end

  def touch_in
    fail 'Insufficient funds on card' if @balance < MINIMUM_FARE
    @in_journey = true 
  end 

  def touch_out 
    deduct(MINIMUM_FARE)
    @in_journey = false
  end 

  private 

  def deduct(num)
    @balance -= num
  end
end