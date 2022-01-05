require 'oystercard'

describe Oystercard do

  it 'balance starts with zero' do
    expect(subject.balance).to eq 0
  end

  it '#top_up is adding money to the balance' do
    expect { subject.top_up(5) }.to change { subject.balance }.by 5
  end

  it 'has a balance limit' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1 }.to raise_error 'You have reached your balance limit'
  end

it '#deduct fare from card' do
  subject.top_up(20)
  expect { subject.deduct(10) }.to change { subject.balance }.by -10
end

end
