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

  describe '#deduct' do
    it "deducts £2" do
      oystercard = Oystercard.new
      oystercard.deduct(2)
      expect(oystercard.balance).to eq(-2)
    end
  end

  describe '#touch_in' do
    it "changes status to 'In use'" do
      oystercard = Oystercard.new
      oystercard.touch_in
      expect(oystercard).to have_attributes(:status => "In use")
    end
  end

  describe '#touch_out' do
    it "changes status to 'Not in use'" do
      oystercard = Oystercard.new
      oystercard.touch_out
      expect(oystercard).to have_attributes(:status => "Not in use")
    end
  end
end
