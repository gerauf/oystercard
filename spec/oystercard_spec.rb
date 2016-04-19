require 'oystercard'

describe Oystercard do

	let(:oyster) { Oystercard.new }

	it { is_expected.to respond_to(:deduct).with(1).argument }

	describe "#initalize" do
		it "has a default balance of £0" do
			expect(oyster.balance).to eq 0
	  end
	end

	describe "#top_up" do
		it "allows putting money on oystercard" do
			expect { oyster.top_up 1 }.to change{ oyster.balance }.by 1
			# expect(Oystercard.new.top_up(3)).to eq 3
		end
		it "can only top up to a maximum of £90" do
			oyster.top_up(90)
			expect{ oyster.top_up(6) }.to raise_error "Can't top up over £90"
		end
	end

	describe '#deduct' do
		it 'reduces balance by value of fare' do
			expect { oyster.deduct 1 }.to change{ oyster.balance }.by -1
			expect { oyster.deduct 2 }.to change{ oyster.balance }.by -2
		end
	end

end
