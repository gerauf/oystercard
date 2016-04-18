require_relative 'oystercard'

oyster = Oystercard.new
oyster.top_up(0)
p oyster.balance

oyster.touch_in
p oyster.in_journey? == false