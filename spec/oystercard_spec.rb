require 'oystercard'

  describe Oystercard do
    it 'has a balance of 0' do
      expect(subject.balance).to eq(0)
    end

  describe '#top_up' do
    it "tops up by £5" do
      oystercard = Oystercard.new
      oystercard.top_up(5)
      expect(subject.balance). to eq(5)
    end
  end
end
