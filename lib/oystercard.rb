class OysterCard
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journeys

  MAXIMUM_BALANCE = 90 
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(num)
    fail 'You have reached upper balance limit' if num + @balance > MAXIMUM_BALANCE
    @balance += num
   end

  def touch_in(entry_station)
    fail 'Insufficient funds on card to touch in' if @balance < MINIMUM_FARE
    @entry_station = entry_station
    @journeys << {start:entry_station}
  end 

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    @journeys.last[:finish] = exit_station
  end 

  def in_journey
    return !entry_station.nil?
  end

  private 

  def deduct(num)
    @balance -= num
  end
end