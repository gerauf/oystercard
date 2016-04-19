class Oystercard

	MAX_BALANCE = 90
	attr_reader :balance

	def initialize
		@balance = 0
		@in_journey = false
	end

	def in_journey?
		in_journey
	end

	def touch_in
		@in_journey = true
	end

	def touch_out
		@in_journey = false
	end

	def top_up(amount)
		fail "Can't top up over £#{MAX_BALANCE}" if exceeded_max?(amount)
		@balance += amount
	end

  def deduct(fare)
    @balance -= fare
  end

  private
  attr_reader :in_journey
  def exceeded_max?(amount)
    (balance + amount) > MAX_BALANCE
  end

end
