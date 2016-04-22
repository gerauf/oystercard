require './lib/oystercard.rb'
require './lib/journey_log.rb'
require './lib/journey.rb'
require './lib/station.rb'

oyster = Oystercard.new
oyster.top_up(Oystercard::DEFAULT_LIMIT)

aldgate = Station.new("aldgate",1)
battersea = Station.new("battersea",3)

p oyster.balance

oyster.touch_in(aldgate)
oyster.touch_out(battersea)
# p oyster.balance
# p oyster

oyster.touch_out(aldgate)
# oyster.touch_out(aldgate)
p oyster.balance
p oyster
#
p oyster.in_journey?
# oyster.touch_out(battersea)
# #
# p oyster.balance
# p oyster
#
# p oyster.in_journey?
# oyster.touch_out(battersea)
#
# p oyster.balance
# p oyster
