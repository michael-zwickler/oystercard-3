require 'oystercard'

describe Oystercard do

  it 'balance starts with zero' do
    expect(subject.balance).to eq 0
  end
it 'allow user to add balance' do
  oyster = Oystercard.new
  expect(oyster).to respond_to(:add_balance).with(1).argument
end
it 'updates the balance' do
  oyster = Oystercard.new
  expect(oyster.add_balance(5)).to eq 5
end

end