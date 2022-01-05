require 'oystercard'

describe Oystercard do

  it 'balance starts with zero' do
    expect(subject.balance).to eq 0
  end

  it 'adding money the balance' do
    oyster = Oystercard.new
    expect(oyster.top_up(5)).to eq 5
  end

  it 'has a balance limit' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1 }.to raise_error 'You have reached your balance limit'
  end

it '#deduct fare from card' do
  subject.top_up(20)
  balance_before = subject.balance()
  subject.deduct(10)
  balance_after = subject.balance()
  delta = balance_before - balance_after
  
  expect(delta).to eq (10)
end

end
