class Journey
  attr_reader :log, :fare

  MIN_FARE = 1
  PEN_FARE = 6

  def initialize
    @log = {}
    @fare = PEN_FARE
  end

  def start station
    make_log(:start, station)
  end

  def finish station
    make_log(:finish, station)
    @fare = MIN_FARE
  end

  private
  def make_log(journey_point, station)
    @log[journey_point] = [station.name, station.zone]
  end


end
