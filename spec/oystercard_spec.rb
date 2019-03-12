require 'oystercard'

  describe Oystercard do
    let(:station) { double :station }
    it 'has a balance of £0' do
      expect(subject.balance).to eq(0)
    end

  describe '#top_up' do
    it "tops up by £5" do
      oystercard = Oystercard.new
      oystercard.top_up(5)
      expect(oystercard.balance).to eq(5)
    end
    it "raises error if top-up takes balance over £90 max" do
      oystercard = Oystercard.new
      oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
      expect {oystercard.top_up(1) }.to raise_error('Maximum balance exceeded')
    end
  end

  describe '#in_journey?' do

    it "raises error when balance is less than minimum fare" do
      oystercard = Oystercard.new
      expect{oystercard.touch_in(station)}.to raise_error("Insufficient credit")
    end

    it "charges the minimum fare upon touch out" do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in(station)
      expect{subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_CHARGE)
    end

    it "remembers the entry station upon touch in" do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in(:station)
      expect(subject.entry_station).to eq :station
    end

    it "resets entry station to nil upon touch out" do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in(:station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end
  end
end
