require 'oystercard'

describe Oystercard do
  let (:oystercard) { Oystercard.new }
  let (:entry_station) { double :entry_station}

  describe '#balance' do
    it 'has a default starting balance' do
      d_s_b = Oystercard::DEFAULT_STARTING_BALANCE
      expect(oystercard.balance).to eq d_s_b
    end

    it 'can be created with a starting balance' do
      oystercard = Oystercard.new(10)
      expect(oystercard.balance).to eq 10
    end
  end

  describe '#top_up' do
    it 'add to balance on card' do
      expect{ oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
    end
    it 'raises error if max balance exceeded' do
      max_balance = Oystercard::MAX_BALANCE
      err_msg = "Max balance of £#{max_balance} exceeded"
      oystercard.top_up max_balance
      expect{oystercard.top_up 1}.to raise_error err_msg
    end
  end

  it 'a new card is not in a journey' do
    expect(oystercard).not_to be_in_journey
  end

  it 'a new card has no entry station' do
    expect(oystercard.entry_station).to be_nil
  end

  describe '#touch_in' do
    context '0 balance' do
      it 'raises error' do
        err_msg = 'Not enough balance for fare'
        expect{ oystercard.touch_in }.to raise_error err_msg
      end
    end

    context '£10 on card' do
      before {oystercard.top_up(10); oystercard.touch_in}
      it 'a card that has been touched in will be in a journey' do
        oystercard.touch_in
        expect(oystercard).to be_in_journey
      end

      it 'a card that has been touched in will have an entry station' do
        expect(oystercard.entry_station).to eq entry_station
      end
    end
  end

  describe '#touch_out' do
    before {oystercard.top_up(10); oystercard.touch_in}

    it "a card that has touched out after touching in won't be in a journey" do
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end

    it "reduces balance by minimum fare" do
      min_fare = Oystercard::MIN_FARE
      expect{oystercard.touch_out}.to change{oystercard.balance}.by(-min_fare)
    end
  end



end
