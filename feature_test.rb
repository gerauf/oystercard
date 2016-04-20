require './lib/oystercard'
require './lib/station'
require './lib/journey'


noah = Oystercard.new
aldgate = Station.new("aldgate", 1)
shoreditch = Station.new("shoreditch", 2)


#noah.touch_in aldgate

# noah.top_up 9
#
# # noah.touch_in aldgate
# # noah.touch_out shoreditch
#
# p noah.balance
# p noah.journeys
#
#
# noah.touch_in aldgate
#
# noah.touch_in aldgate
#
# noah.touch_out shoreditch
# p noah.balance

noah = Journey.new
p noah.log
# noah.start aldgate
# p noah.log
# p noah.log[:start]
noah.finish shoreditch
p noah.log
p noah.log[:start]
