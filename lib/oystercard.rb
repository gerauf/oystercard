require_relative 'journey'
require_relative 'journey_log'

class Oystercard

  attr_reader :balance

  DEFAULT_LIMIT = 90
  MIN_FARE = 90

  def initialize(journey_log_class = JourneyLog)
    @balance = 0.00
    @journey_log = journey_log_class.new
  end

  def top_up(money)
    fail top_up_fail_message if limit_reached?(money)
    @balance += money
  end

  def in_journey?
    !@journey_log.complete?
  end

  def touch_in(station)
    # deduct @journey_log.journeys.last if in_journey?
    fail insufficient_funds if not_enough_credit?
    @journey_log.start station
  end

  def touch_out(station)
    @journey_log.start unless in_journey?
    @journey_log.finish station
    deduct @journey_log.journeys.last
  end

private
  def not_enough_credit?
    @balance < MIN_FARE
  end

  def limit_reached?(money)
    @balance + money > DEFAULT_LIMIT
  end

  def deduct item
    @balance -= item.fare
  end

  def top_up_fail_message
    "Maximum limit of £#{DEFAULT_LIMIT} exceeded"
  end

  def insufficient_funds
    "Please top up, not enough credit"
  end

end
