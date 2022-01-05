class Oystercard
  attr_reader :balance
  attr_reader :entry_station

  MAXIMUM_BALANCE = 90 
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
  end

  def top_up(num)
    fail 'You have reached your balance limit' if num + @balance > MAXIMUM_BALANCE
    @balance += num
  end

  def touch_in(entry_station)
    fail 'Insufficient funds on card' if @balance < MINIMUM_FARE
    @entry_station = entry_station
  end 

  def touch_out 
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end 

  def in_journey
    return !entry_station.nil?
  end

  private 

  def deduct(num)
    @balance -= num
  end
end