class Oystercard

	MAX_BALANCE = 90
  MIN_FARE = 1

	attr_reader :balance, :entry_station

	def initialize
		@balance = 0
    @entry_station = nil
	end

	def in_journey?
		# @entry_station != nil
		!!@entry_station
  end

	def touch_in station
    fail "Not enough credit" unless enough_credit?
    @entry_station = station
	end

	def touch_out
		deduct MIN_FARE
    @entry_station = nil
    "You have left the building"
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
