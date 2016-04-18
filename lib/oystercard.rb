class Oystercard
  attr_reader :balance

  DEFAULT_STARTING_BALANCE = 0
  MAX_BALANCE = 90

  def initialize(starting_balance = DEFAULT_STARTING_BALANCE)
    @balance = starting_balance
    @in_journey = false
  end

  def top_up(cash)
    fail "Max balance of £#{MAX_BALANCE} exceeded" if exceeds_max_balance?(cash)
    @balance += cash
  end

  def deduct(value)
    fail "Insufficient funds" if balance_too_low?(value)
    @balance -= value
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end


  private
  attr_reader :in_journey
  def exceeds_max_balance?(cash)
    (balance + cash) > MAX_BALANCE
  end

  def balance_too_low?(value)
    balance - value < 0
  end

end
