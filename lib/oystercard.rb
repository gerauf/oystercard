class Oystercard

	MAX_BALANCE = 90
	attr_reader :balance

	def initialize
		@balance = 0
	end

	def top_up(amount)
		fail "Can't top up over £#{MAX_BALANCE}" if exceeded_max?(amount)
		@balance += amount
	end

  def deduct(fare)
    @balance -= fare
  end

  private
  def exceeded_max?(amount)
    (balance + amount) > MAX_BALANCE
  end


end
