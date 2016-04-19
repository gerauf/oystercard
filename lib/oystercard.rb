class Oystercard

	MAX_BALANCE = 90
  MIN_FARE = 1

	attr_reader :balance, :entry_station, :exit_station, :journeys

	def initialize
		@balance = 0
    @journeys = []
    @journey = {}
	end

	def in_journey?
		!@journey.empty?
  end

	def touch_in station
    fail "Not enough credit" unless enough_credit?
    @journey[:entry_station] = station
	end

	def touch_out station
    @journey[:exit_station] = station
    @journeys << @journey
    @journey = {}
    deduct MIN_FARE
	end

	def top_up amount
		fail "Can't top up over £#{MAX_BALANCE}" if exceeded_max? amount
		@balance += amount
	end

  private
  attr_reader :in_journey
  def exceeded_max? amount
    (balance + amount) > MAX_BALANCE
  end

  def deduct fare
    @balance -= fare
  end

  def enough_credit?
    balance >= MIN_FARE
  end

end
