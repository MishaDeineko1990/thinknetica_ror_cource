require_relative 'instance_counter'

class Route
  attr_reader :list

  include InstanceCounter

  def initialize(start_station, finish_station)
    @list = [start_station, finish_station]
    self.register_instance
  end

  def add(station)
    @list.insert(@list.count - 1, station)
  end
  
  def del(station)
    @list.delete(station)
  end 

end
