class Oystercard

  def initialize
    @balance = 0
  end

  def show_balance
    balance
  end

  def add(cash)
    @balance += cash
  end


  private

  attr_reader :balance

end