class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 2

  attr_writer :entry_station
  attr_reader :balance, :status, :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    fail "Maximum balance exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient credit" if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
  end

  def in_journey?
    return true if @entry_station != nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
