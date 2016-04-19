require 'oystercard'

describe Oystercard do

	let(:oyster) { Oystercard.new }
	let(:station) { double :station }

	it "default balance is £0" do
		expect(oyster.balance).to eq 0
	end

	it "not in journey" do
		expect(oyster).not_to be_in_journey
	end

	context "when touched in" do
		before {oyster.top_up(Oystercard::MIN_FARE)}
		before {oyster.touch_in(station)}
		it "is in journey" do
			expect(oyster).to be_in_journey
		end

		context "when touched out" do
			before {oyster.touch_out}
			it "is not in journey" do
				expect(oyster).not_to be_in_journey
			end
		end
	end

	describe "#top_up" do
		it "adds money to oystercard" do
			expect { oyster.top_up 1 }.to change{ oyster.balance }.by 1
			# expect(Oystercard.new.top_up(3)).to eq 3
		end
		it "maximum balance of £90" do
			oyster.top_up(Oystercard::MAX_BALANCE)
			expect { oyster.top_up(6) }.to raise_error "Can't top up over £90"
		end
	end

	describe "#touch_in" do

		it 'raises error if balance is below minimum fare' do
			expect {oyster.touch_in(station)}.to raise_error "Not enough credit"
		end

		context 'minimum fare on card' do
			before { oyster.top_up(Oystercard::MIN_FARE) }

			it 'records the last entry station' do
				oyster.touch_in(station)
				expect(oyster.entry_station).to eq station
			end
		end

	end

	describe "#touch_out" do
		before {oyster.top_up(Oystercard::MIN_FARE)}
		before {oyster.touch_in(station)}
		it "deducts money from card" do
			expect {oyster.touch_out}.to change{ oyster.balance }.by -Oystercard::MIN_FARE
		end

		it 'entry station set to nil' do
			oyster.touch_out
			expect(oyster.entry_station).to be_nil
		end

		it "returns msg that you have touched out" do
			expect(oyster.touch_out).to eq "You have left the building"
		end
	end
end
