require 'oystercard'

describe Oystercard do

	let(:oyster) { Oystercard.new }

	describe "#initalize" do
		it "default balance is £0" do
			expect(oyster.balance).to eq 0
	  end
	end

	describe "#top_up" do
		it "adds money to oystercard" do
			expect { oyster.top_up 1 }.to change{ oyster.balance }.by 1
			# expect(Oystercard.new.top_up(3)).to eq 3
		end
		it "top up maximum of £90" do
			oyster.top_up(90)
			expect { oyster.top_up(6) }.to raise_error "Can't top up over £90"
		end
	end

	describe "#deduct" do
		it "reduces balance by value of fare" do
			expect { oyster.deduct 1 }.to change{ oyster.balance }.by -1
			expect { oyster.deduct 2 }.to change{ oyster.balance }.by -2
		end
	end

	describe "#in_journey?" do
		it "new oystercard not in journey" do
			expect(oyster).not_to be_in_journey
		end
		
		context "#touch_in" do
			before {oyster.touch_in}

			it "in journey" do
				expect(oyster).to be_in_journey
			end

			context "#touch_out" do
				before {oyster.touch_out}
				it "not in journey" do
					expect(oyster).not_to be_in_journey
				end
			end
		end
	end
end
