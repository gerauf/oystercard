

class Journey
  attr_reader :entry_station, :exit_station

  MIN_FARE = 1
  PEN_FARE = 6

  def initialize station = nil
    @entry_station = station
    @exit_station = nil
  end

  def finish station
    @exit_station = station
    self
  end

  def complete?
    !!@entry_station && !!@exit_station
  end

  def fare
    complete? ? MIN_FARE : PEN_FARE
  end

end
