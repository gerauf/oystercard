class Journey
  attr_reader :log, :fare

  MIN_FARE = 1
  PEN_FARE = 6

  def initialize
    @log = {}
  end

  def start station
    make_log(:start, station)
  end

  def finish station
    make_log(:finish, station)
  end

  def fare
    log[:start].nil? ? PEN_FARE : MIN_FARE
  end

  private
  def make_log(journey_point, station)
    @log[journey_point] = [station.name, station.zone]
  end


end
