require_relative 'instance_counter'

class Route
  attr_reader :list

  include InstanceCounter

  def initialize(start_station, finish_station)
    @list = [start_station, finish_station]
    valid?(@list)
    self.register_instance
  end

  def add(station)
    @list.insert(@list.count - 1, station)
  end
  
  def del(station)
    @list.delete(station)
  end
  protected
  def valid?(list)
    raise "Stations in route must be uniq" if list.uniq.count != list.count
    true
  end

end
