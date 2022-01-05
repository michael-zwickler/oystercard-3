require 'oystercard'

describe Oystercard do

  let(:station) { double :station }

  it 'balance starts with zero' do
    expect(subject.balance).to eq 0
  end

  it '#top_up is adding money to the balance' do
    expect { subject.top_up(5) }.to change { subject.balance }.by 5
  end

  it 'has a upper balance limit' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1 }.to raise_error 'You have reached your balance limit'
  end

  it 'tells us in_journeyis false by default' do 
    expect(subject.in_journey).to be false
  end 

  it '#touch_in to change in_journey to true' do 
    subject.top_up(10)
    expect { subject.touch_in(station) }.to change{ subject.in_journey }.from(false).to(true)
  end 

  it 'will not touch_in when below minimum balance' do
    expect { subject.touch_in(station) }.to raise_error('Insufficient funds on card')  
  end

  it '#touch_in will assign the entry station to the oystercard' do
    subject.top_up(10)
    expect { subject.touch_in(station) }.to change { subject.entry_station }.from(nil).to(station)
  end

    it '#touch_out to change in_journey to false' do 
    subject.top_up(10)
    subject.touch_in(station)
    expect { subject.touch_out }.to change{ subject.in_journey }.from(true).to(false)
  end

  it '#touch_out will deduct minimum fare from balance' do 
    subject.top_up(10)
    expect { subject.touch_out }.to change{ subject.balance }.by (-Oystercard::MINIMUM_FARE)
  end

  it '#touch_out will forget the entry_station' do
    subject.top_up(10)
    subject.touch_in(station)
    expect { subject.touch_out }.to change{ subject.entry_station }.from(station).to(nil)
  end

end
