class Oystercard
  attr_reader :balance

  DEFAULT_STARTING_BALANCE = 0
  MAX_BALANCE = 90

  def initialize(starting_balance = DEFAULT_STARTING_BALANCE)
    @balance = starting_balance
  end

  def top_up(cash)
    fail "Max balance of £#{MAX_BALANCE} exceeded" if exceeds_max_balance?(cash)
    @balance += cash
  end

  def deduct(value)
    fail "Insufficient funds" if balance_too_low?(value)
    @balance -= value
  end


  private
  def exceeds_max_balance?(cash)
    (balance + cash) > MAX_BALANCE
  end

  def balance_too_low?(value)
    balance - value < 0
  end

end
