require 'oystercard'
require 'journey'

describe OysterCard do

  let(:station) { double :station }

  context 'when new oystercard created' do
    describe 'balance' do
      it { expect(subject.balance).to eq 0 }
    end
    describe 'journeys' do
      it { expect(subject.journeys).to be_empty }
    end
    describe '#in_journey' do 
      it { expect(subject.in_journey).to be false }
    end 
  end

  context 'when oystercard balance is out of limits' do
    describe '#top_up' do
      it 'throws upper balance error' do
        subject.top_up(OysterCard::MAXIMUM_BALANCE)
        expect{ subject.top_up 1 }.to raise_error 'You have reached upper balance limit'
      end
    end
    describe '#touch_in' do
      it 'throws insufficient balance error' do
        expect { subject.touch_in(station) }.to raise_error('Insufficient funds on card to touch in')  
      end
    end
  end

  context 'when oystercard balance is within limits' do
    subject do
      card = OysterCard.new()
      card.top_up(10)
      break card
    end

    describe '#touch_in' do
      it 'changes in_journey to true' do 
        expect { subject.touch_in(station) }.to change{ subject.in_journey }.from(false).to(true)
      end 
    end
    describe '#top_up' do
      it 'adds money to the balance' do
        expect { subject.top_up(5) }.to change { subject.balance }.by 5
      end
    end
    describe '#touch_out' do
      it 'changes in_journey to false' do 
        subject.touch_in(station)
        expect { subject.touch_out(station) }.to change{ subject.in_journey }.from(true).to(false)
      end
      it 'deducts minimum fare from balance' do 
        subject.touch_in(station)
        expect { subject.touch_out(station) }.to change{ subject.balance }.by (-OysterCard::MINIMUM_FARE)
      end
    end
    describe '#touch_in and #touch_out' do
      it "will create a new journey" do
        
        test_journey = Journey.new
        test_journey.begin_journey(station)
        test_journey.end_journey(station)

        subject.touch_in(station)
        subject.touch_out(station)
        expect(subject.journeys.first.reader).to eq test_journey.reader
      end
    end
  end
end

