require 'oystercard'
class Journey

  attr_reader :journey_history

  def initialize(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
    @journey_history = []
  end

  def journey_history
    @journey_history << { entry: @entry_station, exit: @exit_station }
  end

  def in_journey?
    return true if @entry_station != nil
  end

end
