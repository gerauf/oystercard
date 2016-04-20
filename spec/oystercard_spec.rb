require 'oystercard'

describe Oystercard do

	let(:oyster) { described_class.new }
	let(:station) { double :station }
	let(:station2) { double :station }
	let(:journey) {{entry_station: station, exit_station: station2}}

	it "default balance is £0" do
		expect(oyster.balance).to eq 0
	end

	it "journey history is empty" do
		expect(oyster.journeys).to be_empty
	end

	it "not in journey" do
		expect(oyster).not_to be_in_journey
	end

	context "when touched in" do
		before {oyster.top_up described_class::MIN_FARE }
		before {oyster.touch_in(station)}
		it "is in journey" do
			expect(oyster).to be_in_journey
		end

		context "when touched out" do
			before {oyster.touch_out station2}
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
			oyster.top_up described_class::MAX_BALANCE
			expect { oyster.top_up(6) }.to raise_error "Can't top up over £90"
		end
	end

	describe "#touch_in" do

		it 'raises error if balance is below minimum fare' do
			expect {oyster.touch_in(station)}.to raise_error "Not enough credit"
		end

	end

	describe "#touch_out" do
		before {oyster.top_up described_class::MIN_FARE }
		before {oyster.touch_in(station)}
		it "deducts money from card" do
			expect {oyster.touch_out station2}.to change{ oyster.balance }.by -described_class::MIN_FARE
		end

	end

	context "after one journey" do
		before {oyster.top_up described_class::MIN_FARE }
		before {oyster.touch_in station}
		before {oyster.touch_out station2}

		describe '#journeys' do
			it 'shows entry and exit stations' do
					expect(oyster.journeys).to include journey
			end
		end
	end
end
