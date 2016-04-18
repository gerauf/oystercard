class Oystercard
  attr_reader :balance

  DEFAULT_STARTING_BALANCE = 0
  MAX_BALANCE = 90

  def initialize(starting_balance = DEFAULT_STARTING_BALANCE)
    @balance = starting_balance
  end

  def top_up(cash)
    fail "Feck off" if exceeds_max_balance?(cash)
    @balance += cash
  end


  private
  def exceeds_max_balance?(cash)
    (balance + cash) > MAX_BALANCE
  end

end
