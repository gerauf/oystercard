require 'oystercard'

describe Oystercard do
  let (:oystercard) { Oystercard.new }

  it 'new oystercards have 0 balance' do
   expect(oystercard.show_balance).to eq 0
 end

 it { is_expected.to respond_to(:add).with(1).argument }

 describe '#add' do

  it 'money added should show up on balance' do
    oystercard.add(10)
    expect(oystercard.show_balance).to eq 10
  end

 end

end