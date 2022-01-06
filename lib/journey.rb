class Journey 

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize()
    @in_journey = false
    @entry_station = nil
    @exit_station = nil
  end

  def begin_journey(entry_station)
    @entry_station = entry_station
    @in_journey = true    
  end

  def end_journey(exit_station)
    @exit_station = exit_station
    @in_journey = false
  end

  def reader()
    [@entry_station, @exit_station]
  end

  def in_journey?
    return @in_journey
  end 

  def calculate_fare
    if @entry_station.nil? && !@exit_station.nil?
      return PENALTY_FARE
    elsif !@entry_station.nil? && @exit_station.nil?
      return PENALTY_FARE
    end
    return MINIMUM_FARE
  end 

end 