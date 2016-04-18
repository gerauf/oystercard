require 'oystercard'

describe Oystercard do
  let (:empty_oystercard) { Oystercard.new }
  let (:oystercard) { Oystercard.new(10) }

  describe '#balance' do
    it 'new oystercards have a default 0 balance' do
      expect(empty_oystercard.balance).to eq 0
    end

    it 'new oystercards can be created with a starting balance' do
      expect(oystercard.balance).to eq 10
    end
  end

  describe '#add' do
    it 'money added should show up on balance' do
      empty_oystercard.add(10)
      expect(empty_oystercard.balance).to eq 10
    end
  end

end