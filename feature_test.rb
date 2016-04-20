require '../lib/oystercard'
require '../lib/station'

noah = Oystercard.new
aldgate = Station.new("aldgate", 1)
shoreditch = Station.new("shoreditch", 2)


#noah.touch_in aldgate

noah.top_up 3

noah.touch_in aldgate
noah.touch_out shoreditch

p noah.balance
p noah.journeys
