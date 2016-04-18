class Oystercard
  attr_reader :balance

  DEFAULT_STARTING_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize(starting_balance = DEFAULT_STARTING_BALANCE)
    @balance = starting_balance
    @in_journey = false
  end

  def top_up(cash)
    fail "Max balance of £#{MAX_BALANCE} exceeded" if exceeds_max_balance?(cash)
    @balance += cash
  end

  def touch_in
    fail 'Not enough balance for fare' if balance_too_low?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
  end

  def in_journey?
    in_journey
  end

  def entry_station

  end


  private
  attr_reader :in_journey
  def exceeds_max_balance?(cash)
    (balance + cash) > MAX_BALANCE
  end

  def balance_too_low?
    balance < MIN_FARE
  end

  def deduct(value)
    @balance -= value
  end

end
