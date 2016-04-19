require 'oystercard'

describe Oystercard do

	let(:oyster) { Oystercard.new }


	it "default balance is £0" do
		expect(oyster.balance).to eq 0
	end

	it "not in journey" do
		expect(oyster).not_to be_in_journey
	end

	it {is_expected.to respond_to(:touch_out)}

	context "when touched in" do
		before {oyster.top_up(Oystercard::MIN_FARE)}
		before {oyster.touch_in}
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
		it "top up maximum of £90" do
			oyster.top_up(Oystercard::MAX_BALANCE)
			expect { oyster.top_up(6) }.to raise_error "Can't top up over £90"
		end
	end

	describe "#deduct" do
		it "reduces balance by value of fare" do
			expect { oyster.deduct 1 }.to change{ oyster.balance }.by -1
			expect { oyster.deduct 2 }.to change{ oyster.balance }.by -2
		end
	end

	describe "#touch_in" do
		it 'raises error if balance is below minimum fare' do
			expect {oyster.touch_in}.to raise_error "Not enough credit"
		end

		it 'can touch in if enough credit' do
			oyster.top_up(Oystercard::MIN_FARE)
			expect(oyster.touch_in).to eq true
		end
	end

end
