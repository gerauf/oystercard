require 'oystercard'

describe Oystercard do
  let (:oystercard) { Oystercard.new }
  let (:oystercard_with10) { Oystercard.new(10) }

  describe '#balance' do
    it 'new oystercards have a default 0 balance' do
      expect(oystercard.balance).to eq 0
    end

    it 'new oystercards can be created with a starting balance' do
      expect(oystercard_with10.balance).to eq 10
    end
  end

  describe '#top_up' do
    it 'add to balance on card' do
      expect{ oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
    end
    it 'raises error if max balance exceeded' do
      max_balance = Oystercard::MAX_BALANCE
      oystercard.top_up max_balance
      expect{oystercard.top_up 1}.to raise_error "Feck off"
    end

  end

end
