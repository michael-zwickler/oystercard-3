require 'journey' 

RSpec.describe Journey do

  describe '#fare' do 
    describe 'it charges a penalty fare if there is an omission of a exit station' do 
      it do 
        subject.begin_journey("Central")
        expect(subject.calculate_fare).to eq (Journey::PENALTY_FARE)  
      end
    end

    describe 'it charges a penalty fare if there is an omission of a entry station' do 
      it do 
        subject.end_journey("Central")
        expect(subject.calculate_fare).to eq (Journey::PENALTY_FARE)  
      end
    end

    describe 'it charges a the mininmum fare for a completed journey' do 
      it do 
        subject.begin_journey("Central")
        subject.end_journey("Downtown")
        expect(subject.calculate_fare).to eq (Journey::MINIMUM_FARE)  
      end
    end
  end

end  