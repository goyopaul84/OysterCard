require 'oystercard'

  describe Oystercard do
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

  describe '#touch_in' do
    it "changes status to 'In use'" do
      oystercard = Oystercard.new
      oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
      oystercard.touch_in
      expect(oystercard).to have_attributes(:status => "In use")
    end
  end

  describe '#touch_out' do
    it "changes status to 'Not in use'" do
      subject.touch_out
      expect(subject).to have_attributes(:status => "Not in use")
    end
  end

  describe '#in_journey?' do
    it "responds true if status is 'In use''" do
      oystercard = Oystercard.new
      oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq true
    end

    it "responds false if status is 'Not in use'" do
    oystercard = Oystercard.new
    expect(oystercard.in_journey?).to eq false
    end

    it "raises error when balance is less than minimum fare" do
      oystercard = Oystercard.new
      expect{oystercard.touch_in}.to raise_error("Insufficient credit")
    end

    it "charges the minimum fare upon touch out" do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in
      expect{subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_CHARGE)
    end
  end
end
