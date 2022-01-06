class Journey 

  def initialize()
    @in_journey = false
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

end 