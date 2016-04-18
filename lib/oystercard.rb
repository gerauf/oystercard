class Oystercard
  attr_reader :balance

  def initialize(starting_balance = DEFAULT_STARTING_BALANCE)
    @balance = starting_balance
  end

  def add(cash)
    @balance += cash
  end


  private

  DEFAULT_STARTING_BALANCE = 0

end