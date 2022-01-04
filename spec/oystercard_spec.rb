require 'oystercard'

describe Oystercard do

  it 'balance starts with zero' do
    expect(subject.balance).to eq 0
  end

it 'allow user to add balance' do
  oyster = Oystercard.new
  expect(oyster).to respond_to(:top_up).with(1).argument
end

it 'updates the balance' do
  oyster = Oystercard.new
  expect(oyster.top_up(5)).to eq 5
end

it 'has a balance limit' do
  maximum_balance = Oystercard::MAXIMUM_BALANCE
  subject.top_up(maximum_balance)
  expect{ subject.top_up 1 }.to raise_error 'You have reached your balance limit'
end

end