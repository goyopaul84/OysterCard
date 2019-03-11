class Oystercard

  MAXIMUM_BALANCE = 90

  attr_reader :balance, :status 

  def initialize
    @balance = 0
    @status
  end

  def top_up(amount)
    fail "Maximum balance exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @status = "In use"
  end
end
