require 'station'

RSpec.describe Station do
  
  subject { Station.new("Central Station", 1) }

  context 'when new station created' do
    describe 'it has a zone defined' do
      it { expect(subject.zone).to be_a(Numeric) }
    end
    describe 'it has a name defined' do
      it { expect(subject.name).to be_a(String) }
    end
    describe 'zone value is returned' do
      it { expect(subject.zone).to eq 1 }
    end

  end

end