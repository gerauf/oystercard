class JourneyLog

  attr_reader :journeys

  def initialize journey_class = Journey
    @journeys = []
    @current_journey = nil
    @journey_factory = journey_class
  end

  def start(*station)
    @current_journey = journey_factory.new station
  end

  def finish station
    @journeys << @current_journey.finish(station)
    @current_journey = nil
  end

  def complete?
    !!@current_journey
  end


  private
  attr_reader :journey_factory
end
