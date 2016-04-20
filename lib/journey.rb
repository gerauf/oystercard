class Journey
  attr_reader :log

  def initialize
    @log = {}
  end

  def start station
    make_log(:start, station)
  end

  def finish station
    make_log(:finish, station)
  end

  private
  def make_log(journey_point, station)
    @log[journey_point] = [station.name, station.zone]
  end


end
