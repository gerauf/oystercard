class Oystercard

	MAX_BALANCE = 90
	MIN_FARE = 1

	attr_reader :balance, :journeys

	def initialize
		@balance = 0
	  @journeys = []
	end

	def in_journey?
		!!@trip
	end

	def touch_in station
	  fail "Not enough credit" unless enough_credit?
		@trip = Journey.new
		@trip.start station
	end

	def touch_out station
		@trip.finish station
		@journeys << @trip.log
		deduct @trip.fare
		@trip = nil
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
